class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


   #   def after_sign_in_path_for(resource)
   #  '/trips/new'
	  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :first_name, :last_name, :phonenumber, :birthdate, :profile_pic) }
  end# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
