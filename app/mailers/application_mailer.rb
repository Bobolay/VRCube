class ApplicationMailer < ActionMailer::Base
  default from: ENV["smtp_default_from"]
  layout 'mailer'
  helper Cms::Helpers::UrlHelper
  helper ApplicationHelper
  helper AdminMailerHelper

  protected

  def set_variables(action_name)
    @email_title = I18n.t("#{self.class.name.underscore}.#{action_name}.title")
  end

  def receivers(name = @receivers_key)
    config_class = "FormConfigs::#{name.classify}".constantize
    to = config_class.first.try(&:emails) || config_class.default_emails
    to
  end
end
