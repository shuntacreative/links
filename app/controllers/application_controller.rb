class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender])
<<<<<<< HEAD
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction])
=======

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :self_introduction])
    
>>>>>>> 511a8dec66873d53aa27cadd6c7ebfd76ec42927
  end
  
end
