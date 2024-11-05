class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  # Ajoute les paramètres autorisés pour Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Méthode pour autoriser les paramètres first_name et last_name dans Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
