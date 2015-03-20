require 'spec_helper'

describe "In the dashboard, Users" do
  context "as Admin" do
    before{ login_admin }

    it "lists users for a site", js: true do
      FactoryGirl.create_list(:user, 3)

      Storytime.user_class.all.each do |user|
        user.storytime_memberships.create(site: @current_site, storytime_role: Storytime::Role.find_by(name: "writer"))
      end

      visit storytime.dashboard_path
      click_link "utility-menu-toggle"
      click_link "users-link"

      Storytime.user_class.all.each do |u|
        expect(page).to have_content u.storytime_name
      end
    end

    it "deletes a user from the site", js: true do
      user = FactoryGirl.create(:user)
      user.storytime_memberships.create(site: @current_site, storytime_role: Storytime::Role.find_by(name: "writer"))

      user_count = Storytime.user_class.count
      membership_count = Storytime::Membership.count

      visit storytime.dashboard_path
      click_link "utility-menu-toggle"
      click_link "users-link"

      expect(page).to have_content(user.storytime_name)

      find("#user_#{user.id}").hover
      click_link("delete_user_#{user.id}")
      
      expect(page).to_not have_content(user.storytime_name)

      expect(Storytime.user_class.count).to eq(user_count)
      expect(Storytime::Membership.count).to eq(membership_count-1)
    end

  end
end