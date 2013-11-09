class Admin::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_authenticity_token, :only => [:google_apps]


  def google_apps
    @admin = Admin.find_for_open_id(request.env["omniauth.auth"], current_admin)

    if @admin.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @admin, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      Rails.logger.debug "admin not persisted"
  end
end
