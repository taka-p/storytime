module Storytime::PostOutsideLink
  extend ActiveSupport::Concern

  included do
    validates :outside_link, format: /\A#{URI::regexp(%w(http https))}\z/, if: :allow_nil
  end
end
