class FormsController < ApplicationController
  def basic_request
    resource_class = Object.const_get(action_name.classify)
    r = resource_class.new(request_params)
    r.save
    r.notify_admin

    render json: {}, status: 201
  end

  alias_method :call_request, :basic_request
  alias_method :session_order, :basic_request
  alias_method :home_order, :basic_request

  def request_params
    params_key = action_name
    if action_name.to_s.in?(["session_order", "home_order"])
      params_key = "order"
    end
    h = params[params_key]
    return {} if h.nil?
    if h["date"] && h["time"]
      h["datetime"] = DateTime.strptime("#{h["date"]} #{h["time"]}", "%d.%m.%Y %H:%M")
    elsif h["date"]
      h["datetime"] = DateTime.strptime("#{h["date"]}", "%d.%m.%Y")
    end

    h
  end
end