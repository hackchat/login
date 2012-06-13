class ChangeAuthTokenToUserToken < ActiveRecord::Migration
  def change
    rename_column :users, :auth_token, :user_token
  end
end
