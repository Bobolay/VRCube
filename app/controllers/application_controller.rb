class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  include ActionView::Helpers::OutputSafetyHelper
  include Cms::Helpers::ImageHelper
  include ActionView::Helpers::AssetUrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include Cms::Helpers::UrlHelper
  include Cms::Helpers::PagesHelper
  include Cms::Helpers::MetaDataHelper
  include Cms::Helpers::NavigationHelper
  include Cms::Helpers::ActionView::UrlHelper
  include Cms::Helpers::Breadcrumbs
  include ActionControllerExtensions::InstanceMethods
  include ApplicationHelper
  include Cms::Helpers::AnotherFormsHelper
  include Cms::Helpers::TagsHelper

  def render_not_found
    render template: "errors/not_found.html.slim"
  end

  def root_without_locale
    redirect_to "/#{I18n.locale}"
  end

  def default_url_options
    {locale: I18n.locale}
  end

  before_action :initialize_locale_links

  def initialize_locale_links
    locale_links = {}
    Cms.config.provided_locales.each do |locale|
      #url = @page_instance.try{|p| v = p.url(locale); v = p.try(:default_url) if v.blank?; if !v.start_with?("/") then v = "/#{v}" end;   ("/#{locale}/#{v}" ) }
      url = @page_instance.try{ |p| v = p.url(locale); v = p.try(:default_url, locale) if v.blank?; return nil if v.blank?; if !v.start_with?("/") then v = "/#{v}" end;  v }

      locale_links[locale.to_sym] = url
    end

    @_locale_links = locale_links
  end
end
