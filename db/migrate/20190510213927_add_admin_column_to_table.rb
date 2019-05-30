class AddAdminColumnToTable < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_admin, false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
