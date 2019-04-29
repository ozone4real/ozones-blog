class AddTimeToReadToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :time_to_read, :string
  end
end
