class SessionOrder < ActiveRecord::Base
  attr_accessible *attribute_names

  def notify_admin
    AdminMailer.new_session_order(self).deliver_now
  end
end
