class AdminController < ApplicationController
  before_action :boot_non_admins # boots you to the main page if you lack admin 

  def users
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
