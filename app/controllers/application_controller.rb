class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :phonenumber, :last_name])

  end
  	WillPaginate.per_page = 8

   def authorize_admin
    redirect_to root_path, alert:"Nice try! Don't try hacking me :)"  unless current_user.admin
    #redirects to previous page
    rescue ActionController::RedirectBackError
    redirect_to root_path, alert: "Nice try! Don't try hacking me :)"
end

end

