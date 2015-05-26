class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
	before_action :configure_permitted_parameters, if: :devise_controller?
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
  after_filter :user_activity

  def current_controller?(names)
    "active" if names.include?(params[:controller]) unless params[:controller].blank? || false
  end

  helper_method :current_controller?

  private

  def user_activity
    current_user.try :touch
  end

	protected
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :api_key) }
		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :api_key, :fullname, :about, :facebook, :twitter) }
	end

  def admin_only
    unless current_user.is_admin?
      redirect_to root_path, :alert => "Sorry! You have no permission to view that page."
    end
  end
end
