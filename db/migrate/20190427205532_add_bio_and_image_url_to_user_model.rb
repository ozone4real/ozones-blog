class AddBioAndImageUrlToUserModel < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :image_url, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :full_name, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
