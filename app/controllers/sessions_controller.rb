class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => t(:logged_in)
    else
      redirect_to_back :notice => t(:invalid)
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => t(:logged_out)
  end
end


# Chat is going to ask auth if i have a user
# Auth is going to say no
# Chat is going to say well let's get a user
# Redirect to Auth
# Auth is going to login and set session
# Auth will redirect back to Chat
# Chat will say "Do I have a user?"
# Auth has a session
# Auth responds with "Yeah, here he/she is"