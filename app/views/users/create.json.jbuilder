unless @user.errors.any?
  json.token @user.auth_token
else
  json.errors @user.errors.full_messages
end