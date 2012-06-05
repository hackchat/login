unless @user.errors.any?
  json.(@user, :first_name, :last_name, :email, :auth_token)
else
  json.errors @user.errors.full_messages
end