class CallRequest < ActiveRecord::Base
  attr_accessible *attribute_names

  def notify_admin
    AdminMailer.new_call_request(self).deliver_now
  end
end
