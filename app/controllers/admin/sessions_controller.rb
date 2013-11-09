class Admin::SessionsController < ApplicationController
  def authenticate_admin
    auth_hash = request.env['omniauth.auth']
    session[:admin_user] = auth_hash['user_info']['email']
    redirect_to '/rails_admin'
  end
  def new


  end
end
