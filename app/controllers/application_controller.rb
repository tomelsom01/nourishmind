class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:home, :about, :contact_form, :price, :blogs, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :telephone_number])
  end

  def after_sign_in_path_for(resource)
    yoga_classes_path
  end
  def after_sign_out_path_for(resource_or_scope)
    yoga_classes_path
  end
end
