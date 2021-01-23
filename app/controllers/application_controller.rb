class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?


  def current_customer
    if session[:user_id]

    end
  end

  def admin?
    @admin ||= current_user.admin
  end

  protected

  def after_sign_in_path_for(resource)
    Order.find(session[:order_id]).update(user_id:current_user.id)
    root_path
  end

  def update_allowed_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
   end
end
