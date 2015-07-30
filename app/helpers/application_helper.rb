module ApplicationHelper

	def notice_msg
		alert_types = { notice: :success, alert: :danger }

		close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
		close_button = content_tag(:button, "x", close_button_options)

		alerts = flash.map do |name,msg|
			alert_content = close_button + msg
			alert_type = alert_types[name.to_sym] || name
			alert_class = "alert alert-#{alert_type} alert-dismissable"
			content_tag(:div, alert_content, class: alert_class)
		end

		alerts.join("\n").html_safe
	end
end
