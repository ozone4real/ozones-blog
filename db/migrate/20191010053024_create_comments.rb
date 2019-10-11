class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
    add_index :articles, :slug
    #Ex:- add_index("admin_users", "username")
  end
end
