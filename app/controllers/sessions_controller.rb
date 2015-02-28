# sessions_controller.rb
class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    Identity.create_with_omniauth(auth, current_user)
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
