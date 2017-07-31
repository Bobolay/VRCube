class PagesController < ApplicationController
  before_action :set_page_instance, except: [:index]

  def index
    @games = Game.published.includes(:tags)
    @accordion_slides = AccordionSlide.published
    set_page_metadata(:home)

  end
end