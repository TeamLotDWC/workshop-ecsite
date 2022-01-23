class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:first_name, :family_name, :first_name_kana, :family_name_kana, :address, :zip_code, :phone_number])
  end

   before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  before_action :authenticate_customer!, if: :customer_url

  def customer_url
    request.fullpath.include?("/customers") && request.fullpath.exclude?("/admin")
  end
end
