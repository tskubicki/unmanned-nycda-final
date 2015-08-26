class Admin::GamesController < ApplicationController
	include ApplicationHelper
	before_action :boot_non_admins

	def index
		@games = Game.all.order(created_at: :desc)
	end

	# def create #post
	# 	@user = User.new(user_params)
	# 	if @user.save()
	# 		#success
	# 		puts "Successsfully saved #{@user.username}"
	# 		redirect_to admin_users_path
	# 	else
	# 		#fail
	# 		puts "Something bad happpened trying to save #{@user.username}"
	# 		redirect_to new_admin_user_path
	# 	end
	# end
	
	# def new
	# 	boot_non_admins
	# 	@user = User.new()
	# end
	
	# def edit
	# 	 @user = User.find(params[:id])
	# end

	# def update
	# 	@user = User.find(params[:id])
	# 	@role = @user.role
	# 	@role.is_admin = !@role.is_admin
	# 	@role.save
	# 	redirect_to admin_roles_path
	# end
	
	# def show
	# 	# @friendship = Friendship.new()
	# 	# @user = User.find(params[:id])
	# 	# @user_games = Game.where(user_id: @user.id).order(created_at: :desc)
	# 	# @last_game = @user_games.first
	# 	# @friends = @user.friends
	# 	# @isfriend = Friendship.where(user_id: current_user.id, friend_id: @user.id).exists?
	# end
	
	
	def destroy #delete
		@game = Game.find(params[:id])
		if @game.destroy
			#success
		else
			#fail
		end
		redirect_to admin_games_path
	end

	# private
	# def user_params
	#   params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
	# end

end