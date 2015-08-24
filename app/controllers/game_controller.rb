class GameController < ApplicationController
  def play
  end

  def create
  	@gamedata = JSON.parse(params[:game_data]) #
  	@game = Game.new(
  		user_id: current_user.id,
  		game_time: @gamedata["game_time"],
  		score: @gamedata["score"],
  		damage_taken: @gamedata["damage_taken"],
  		damage_inflicted: @gamedata["damage_inflicted"],
  		laser_time: @gamedata["laser_time"],
  		slaser_time: @gamedata["slaser_time"],
  		mg_time: @gamedata["mg_time"],
  		rocket_time: @gamedata["rocket_time"],
  		mine_time: @gamedata["mine_time"],
    )
  	if @game.save
      #success
      users_to_update = User.find(current_user.id)
      users_to_update.update(total: users_to_update.total + @gamedata["score"])
  		redirect_to user_path(current_user.id)
  	else
  		#fail
  		redirect_to user_path(current_user.id)
  	end
  end

  def leaderboard
    @users = User.all().order(total: :desc)
  end

end
