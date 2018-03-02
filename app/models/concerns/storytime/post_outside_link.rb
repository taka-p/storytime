module Storytime::PostOutsideLink
  extend ActiveSupport::Concern

  # included do
  #   validates :excerpt, length: { in: 0..Storytime.post_excerpt_character_limit }
  #
  #   before_validation :populate_excerpt_from_content
  #
  #   def populate_excerpt_from_content
  #     self.excerpt = (content || draft_content).slice(0..Storytime.post_excerpt_character_limit) if excerpt.blank?
  #
  #     # htmlを保存できるよう修正
  #     # self.excerpt = strip_tags(self.excerpt)
  #     self.excerpt = self.excerpt
  #   end
  # end
end
