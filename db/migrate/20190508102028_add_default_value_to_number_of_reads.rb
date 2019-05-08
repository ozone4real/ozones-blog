class AddDefaultValueToNumberOfReads < ActiveRecord::Migration[5.2]
  def change
    change_column_default :articles, :number_of_reads, 0
  end
end
