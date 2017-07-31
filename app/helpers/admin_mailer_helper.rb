module AdminMailerHelper
  def admin_url(resource, action = :edit)
    if resource.nil? || !resource.respond_to?(:id) || !resource.id
      return
    end
    admin_model_name_str = resource.class.name.underscore.gsub(/\//, "~")
    str = @admin_root + "/" + admin_model_name_str
    action_str = "edit"

    str + "/#{resource.id}" + "/" + action_str
  end

  def render_attributes(resource, *attrs)
    attrs.map{|attr|
      v =  resource.send(attr)
      label = t("admin_mailer.attributes.#{attr}", raise: true) rescue attr.to_s.humanize
      "<p><b>#{label}</b></p><p>#{v}</p>"
    }.join("").html_safe
  end
end