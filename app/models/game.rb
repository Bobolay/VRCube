class Game < ActiveRecord::Base
  attr_accessible *attribute_names

  attr_accessible *attribute_names

  globalize :title, :youtube_video_id

  boolean_scope :published
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  has_tags

  has_cache do
    pages :home
  end
end
