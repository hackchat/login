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
    Rails.logger.error session.inspect
    Rails.logger.error current_user.inspect
    redirect_to redirect_chat if current_user
  end

  def create
    @user = login(params[:email], params[:password], remember_me = false)
    if @user
      session[:user_token] = @user.auth_token
      redirect_to redirect_chat, flash[:notice] => "signed in!"
    else
      flash[:notice] = "Password or email WRONG!"
      render "new"
    end
  end

  def destroy
    logout
    render status: :ok
  end


end