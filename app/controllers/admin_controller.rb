class AdminController < ApplicationController
  include ApplicationHelper
  before_action :boot_non_admins 

  def users
    
  end

  def user_new
    @user = User.new()
  end

  def user_create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(current_user)
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def user_update
   @user = User.find(params[:id])
   @user.update(user_params)
  end

  def get_change_user
  end

  def post_change_user
  end

  def destroy_user
  end

  def friends
  end

  def messages
  end

  def roles
  end

  def games
  end

  def main

  end

  private
  def boot_non_admins #see line 2
    if !current_user || current_user.role.is_admin == false
      redirect_to root_path 
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
  end
end
