if Rails.env.production?
  CHAT_FRONT = "http://hackchat.in"
else
  CHAT_FRONT = "http://hackchat.dev"
end