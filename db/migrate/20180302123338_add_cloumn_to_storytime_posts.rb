class AddCloumnToStorytimePosts < ActiveRecord::Migration
  def change
    add_column :storytime_posts, :outside_link, :string, default: nil
  end
end
