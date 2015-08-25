class AdminController < ApplicationController
  include ApplicationHelper
  before_action :boot_non_admins 

  def users
    if params[:search]
      @users = User.where("username like ?", "%#{params[:search]}%")
    else
      @users = User.all
    end
  end

  def get_create_user
    @user = User.new()
  end

  def post_create_user
    @user = User.new(user_params)
    @user.save
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
end
