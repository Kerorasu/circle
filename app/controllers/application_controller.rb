class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :big_genre, :small_genre, :frequency, :place, :pr])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :big_genre, :small_genre, :frequency, :place, :pr])
    end
end

