class ChangeColumnTypeForArticleStats < ActiveRecord::Migration[5.2]
  def change
    change_column :article_stats, :user_id, :string
  end
end
