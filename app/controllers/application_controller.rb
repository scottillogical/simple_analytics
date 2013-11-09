class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_or_create_network_user_id
    if network_user_id = cookies[:network_user_id]
      Rails.logger.debug "cookie found: #{network_user_id}"
      return network_user_id
    end
    network_user_id = SecureRandom.uuid
    cookies[:network_user_id]  = {value: network_user_id, expires:20.years.from_now}
    Rails.logger.debug "cookie set: #{network_user_id}"
    network_user_id
  end

  def send_blank_gif
    send_data(Base64.decode64("R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="), :type => "image/gif", :disposition => "inline")
  end
end
