class GameController < ApplicationController
  def play
  end
  def create
  	@gamedata = params[:game_data]
  	redirect_to root_path
  end

end
