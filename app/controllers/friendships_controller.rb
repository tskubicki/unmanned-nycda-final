class FriendshipsController < ApplicationController

	def index
		@friendships = Friendship.all
	end

	def create #post
		@friendship = Friendship.new()
		if @friendship.create(friendship_params)
			#success
		else
			#fail
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
	end

	private
	def friendship_params
		 params.require(:friendship).permit(:user_id, :friend_id)
	end
end
