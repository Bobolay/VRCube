class HomeOrder < ActiveRecord::Base
  attr_accessible *attribute_names

  def notify_admin
    AdminMailer.new_home_order(self).deliver_now
  end
end
