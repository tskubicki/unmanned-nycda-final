class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.boolean :is_user
      t.boolean :is_admin
      t.timestamps null: false
    end
  end
end
