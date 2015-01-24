class CreateUserJoinTable < ActiveRecord::Migration
  def change
    create_table :user_follow_connections do |t|
      t.integer :owner_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
