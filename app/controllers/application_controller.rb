class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top, :about]
  before_action :forbid_log_in_user, only: [:about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def forbid_log_in_user
    if   current_user
      flash[:alert] = "You are already logged in user."
      redirect_to books_path
    end
  end
  
  
  
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:alert] = "The account is different."
      redirect_to books_path
    end
  end



  def after_sign_up_path_for(resource)
    user_path(current_user)
  end



  def after_sign_in_path_for(resource)
    user_path(current_user)
  end



  def after_sign_out_path_for(resource)
    root_path
  end




  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
