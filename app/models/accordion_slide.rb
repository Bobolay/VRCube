class AccordionSlide < ActiveRecord::Base
  attr_accessible *attribute_names

  globalize :label, :title, :short_description

  boolean_scope :published
  scope :order_by_sorting_position, -> { order("sorting_position asc") }

  default_scope do
    order_by_sorting_position
  end

  image :image

  has_cache do
    pages :home
  end
end
