class UpdateUserForCasAuthentication < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true

    remove_column :users, :encrypted_password
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at
  end
end
