unless @user.errors.any?
  json.token @user.user_token
else
  json.errors @user.errors.full_messages
end