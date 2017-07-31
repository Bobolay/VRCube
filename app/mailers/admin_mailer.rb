class AdminMailer < ApplicationMailer
  before_action :set_admin_root

  def new_call_request(call_request)
    set_variables(:new_call_request)
    @call_request = call_request

    mail to: receivers, subject: @email_title
  end

  def new_session_order(session_order)
    set_variables(:new_session_order)
    @session_order = session_order

    mail to: receivers, subject: @email_title
  end

  def new_home_order(home_order)
    set_variables(:new_home_order)
    @home_order = home_order

    mail to: receivers, subject: @email_title
  end

  protected

  def set_variables(action_name)
    super
    @receivers_key = action_name.to_s
  end

  def set_admin_root
    @admin_root = (ENV["#{Rails.env}.host_with_port"] || ENV["#{Rails.env}.host"]) + "/admin"
  end
end
