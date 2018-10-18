class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :gender, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :first_name, :last_name, :gender, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    end
end
