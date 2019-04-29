class RenameArticleBody < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :articleBody, :article_body
  end
end
