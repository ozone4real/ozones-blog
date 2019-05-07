class RemoveLikesFromLikeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :likes
  end
end
