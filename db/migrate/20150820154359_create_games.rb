class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.decimal :game_time
      t.decimal :score
      t.decimal :damage_taken
      t.decimal :damage_inflicted
      t.decimal :laser_time
      t.decimal :slaser_time
      t.decimal :mg_time
      t.decimal :rocket_time
      t.decimal :mine_time

      t.timestamps null: false
    end
  end
end
