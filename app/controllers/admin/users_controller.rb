class Admin::UsersController < ApplicationController
	include ApplicationHelper
	before_action :check_for_login

	def index
		if params[:search]
	      @users = User.where("username like ?", "%#{params[:search]}%")
	    else
	      @users = User.all
	    end
	end

	def create #post
		@user = User.new(user_params)
		if @user.save()
			#success
			puts "Successsfully saved #{@user.username}"
			redirect_to admin_users_path
		else
			#fail
			puts "Something bad happpened trying to save #{@user.username}"
			redirect_to new_admin_user_path
		end
	end
	
	def new
		boot_non_admins
		@user = User.new()
	end
	
	def edit
		 @user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		#devise will reject any changes if the password fields are blank
		if params[:user][:password].blank?
			params[:user].delete(:password)
			params[:user].delete(:password_confirmation)
		end

		if @user.update(user_params)
			#success
			redirect_to admin_users_path
		else
			#fail
			redirect_to admin_users_path
		end

		
	end
	
	def show
		# @friendship = Friendship.new()
		# @user = User.find(params[:id])
		# @user_games = Game.where(user_id: @user.id).order(created_at: :desc)
		# @last_game = @user_games.first
		# @friends = @user.friends
		# @isfriend = Friendship.where(user_id: current_user.id, friend_id: @user.id).exists?
	end
	
	
	def destroy #delete
		@user = User.find(params[:id])
		if @user.destroy
			#success
		else
			#fail
		end
		redirect_to admin_users_path
	end

	private
	def user_params
	  params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
	end

end