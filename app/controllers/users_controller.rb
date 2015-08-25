class UsersController < ApplicationController
	include UsersHelper
	before_action :check_for_login

	def index
		if params[:search]
	      @users = User.where("username like ?", "%#{params[:search]}%")
	    else
	      @users = User.all
	    end
		
	end

	def create #post
		@user = User.new()
	end
	
	def new
		@user = User.new()
	end
	
	def edit
		@user = User.new()
	end
	
	def show
		@friendship = Friendship.new()
		@user = User.find(params[:id])
		@user_games = Game.where(user_id: @user.id).order(created_at: :desc)
		@last_game = @user_games.first
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

end
