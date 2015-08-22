class GameController < ApplicationController
  def play
  end
  def create
  	@gamedata = JSON.parse(params[:game_data])
  	@game = Game.new(
  		user_id: current_user.id,
  		game_time: @gamedata["game_time"],
  		score: @gamedata["player_score"],
  		damage_taken: @gamedata["damage_taken"],
  		damage_inflicted: @gamedata["damage_inflicted"],
  		laser_time: @gamedata["laser_time"],
  		slaser_time: @gamedata["slaser_time"],
  		mg_time: @gamedata["mg_time"],
  		rocket_time: @gamedata["rocket_time"],
  		mine_time: @gamedata["mine_time"],)
  	if @game.save
  		#success
  		redirect_to root_path
  	else
  		#fail
  		redirect_to root_path
  	end
  end

  private
  def game_params
  	params.require(:game).permit()
  end

end
