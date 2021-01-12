class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  def current_customer
    if session[:user_id]

    end
  end



  protected



  def update_allowed_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
   end
end
