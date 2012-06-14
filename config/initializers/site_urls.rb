if Rails.env.production?
  CHAT_FRONT = "http://hackchat.in"
else
  CHAT_FRONT = "http://hackchat.dev"
  #CHAT_FRONT = "http://hackchat.dev:8080"
end