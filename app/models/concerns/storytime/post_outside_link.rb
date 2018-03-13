module Storytime::PostOutsideLink
  extend ActiveSupport::Concern

  included do
    validates :outside_link, allow_nil: true, allow_blank: true
  end
end
