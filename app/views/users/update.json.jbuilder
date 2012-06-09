if @user.errors.any?
  json.errors @user.errors.full_messages
end