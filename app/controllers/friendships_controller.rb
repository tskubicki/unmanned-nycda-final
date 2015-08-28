class FriendshipsController < ApplicationController
	include ApplicationHelper
	
	before_action :boot_non_admins
	skip_before_action :boot_non_admins, only: [:create]

	def index
		@friendships = Friendship.all
	end

	def create #post
		@friendship = Friendship.new(friendship_params)
		if @friendship.save
			#success
			redirect_to :back
		else
			redirect_to new_friendship_path(@friendship)
		end
	end
	
	def new
		@friendship = Friendship.new()
	end
	
	def edit
		@friendship = Friendship.find(params[:id])
	end
	
	def show
		@friendship = Friendship.find(params[:id])
	end
	
	def update #patch / put
		@friendship = Friendship.find(params[:id])
		if @friendship.update(friendship_params)
			#success
		else
			#fail
		end
	end
	
	def destroy #delete
		@friendship = Friendship.find(params[:id])
		if @friendship.destroy
			#success
		else
			#fail
		end
		redirect_to friendships_path
	end

	private
	def friendship_params
		 params.require(:friendship).permit(:user_id, :friend_id)
	end

end
