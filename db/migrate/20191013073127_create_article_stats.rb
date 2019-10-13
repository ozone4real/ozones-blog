class CreateArticleStats < ActiveRecord::Migration[5.2]
  def change
    create_table :article_stats do |t|
      t.integer :user_id
      t.references :article, foreign_key: true
    end
    add_index :article_stats, [:article_id, :user_id], unique: true
  end
end
