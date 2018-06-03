class AddIndexToUsersAccountId < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :account_name, unique: true
  end
end
