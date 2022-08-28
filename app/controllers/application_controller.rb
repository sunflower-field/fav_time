class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    publics_user_path(current_user)
  end



  def after_sign_out_path_for(resource)
    root_path
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :email, :password, :icon_image])
  end

end
