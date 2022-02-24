class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name, :prospective_buyer_id])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :prospective_buyer_id])
  end
end
