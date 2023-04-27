# frozen_string_literal: false

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include ExceptionHandler

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:username, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(_resource)
    if @user.Admin?
      rails_admin_path
    else
      root_path
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back fallback_location: root_path
  end

  def record_not_found
    render file: 'public/404.html', status: :not_found, layout: false
  end
end
