class UsersController < ApplicationController
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
	end
	
	def new
		boot_non_admins
		@user = User.new()
	end
	
	def edit
		@user = User.new()
	end

	def update
	end
	
	def show
		@user = User.find(params[:id])
		@friendship = Friendship.new()
		@message = Message.new()
		@messages = Message.where(user_id: @user.id)
		@last_game = Game.where(user_id: @user.id).limit(1).order(created_at: :desc)
		@user_games = Game.where(user_id: @user.id).offset(1).limit(5).order(created_at: :desc)
		@friends = @user.friends
		@isfriend = Friendship.where(user_id: current_user.id, friend_id: @user.id).exists?
	end
	
	def update #patch / put
		@user = User.find()
		if @user.update()
			#success
		else
			#fail
		end
	end
	
	def destroy #delete
		@user = User.find()
		if @user.destroy
			#success
		else
			#fail
		end
	end

	private
	def user_params
	  params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
	end
end