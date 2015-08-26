class RegistrationsController < Devise::RegistrationsController
	# prepend_before_filter :require_no_authentication, only: [ :cancel ]

	# def create
 #    super #Nothing special here.
 #  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :avatar)
  end

  # def sign_up(resource_name, resource)
  #   true
  # end
end