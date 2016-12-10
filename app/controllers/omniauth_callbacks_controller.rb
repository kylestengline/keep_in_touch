class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])


    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notcie, :success, :kind => "Facebook") if is_navigational_format?
      if request.env["omniauth.auth"].info.email.blank?
        redirect_to "/users/auth/facebook?auth_type=rerequest&scope=email"
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
