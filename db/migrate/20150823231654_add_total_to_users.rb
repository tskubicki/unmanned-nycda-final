class AddTotalToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.integer :total, :default => 0.0
  	end
  end
end