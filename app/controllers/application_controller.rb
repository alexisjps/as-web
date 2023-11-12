class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :phone, :siret, :photo, :infos_payment, :conditions, :tva])
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :phone, :siret, :photo, :infos_payment, :conditions, :tva])
  end
  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à accéder à cette page."
    redirect_to(request.referrer || root_path)
  end
end
