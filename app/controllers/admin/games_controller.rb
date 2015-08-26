class Admin::GamesController < ApplicationController
	include ApplicationHelper
	before_action :boot_non_admins

	def index
		@games = Game.all.order(created_at: :desc)
	end

	def destroy #delete
		@game = Game.find(params[:id])
		if @game.destroy
			#success
		else
			#fail
		end
		redirect_to admin_games_path
	end
end