if Rails.env.production?
  CHAT_FRONT = "http://hackchat.in"
else
  CHAT_FRONT = "http://localhost:2000"
end