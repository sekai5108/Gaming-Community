class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception



  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:handle])
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end
end
