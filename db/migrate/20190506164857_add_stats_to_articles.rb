class AddStatsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :number_of_reads, :integer
  end
end
