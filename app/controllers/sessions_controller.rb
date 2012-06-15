class SessionsController < ApplicationController

  def show
    @user = current_user
    if @user
      render status: :ok, json: @user
    else
      render status: :unauthorized, json: false
    end
  end

  def new
  end

  def create
    @user = login(params[:email], params[:password], remember_me = false)
    if @user
      session[:user_token] = @user.user_token
      redirect_to CHAT_FRONT, flash[:notice] => "signed in!"
    else
      flash[:notice] = "Password or email WRONG!"
      render "new"
    end
  end

  def destroy
    logout
    reset_session
    redirect_to login_path
  end

end