class UsersController < ApplicationController
	include UsersHelper
	before_action :check_for_login

	def index
		@users = User.all
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
		@user = current_user
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
