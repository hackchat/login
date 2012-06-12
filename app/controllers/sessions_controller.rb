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
    redirect_to redirect_chat if current_user
  end

  def create
    @user = login(params[:email], params[:password], params[:remember_me])
    if @user
      redirect_to redirect_chat, flash[:notice] => "signed in!"
      session[:user_token] = @user.auth_token
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