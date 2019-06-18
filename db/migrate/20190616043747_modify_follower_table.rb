class ModifyFollowerTable < ActiveRecord::Migration[5.2]
  def change
    add_index :followers, :follower_id
    add_index :followers, :followed_id
    add_index :followers, [:follower_id, :followed_id], unique: true
  end
end
