class SessionsController < ApplicationController
  def show
    @user = current_user
    if @user
      render status: :ok
    else
      render status: :unauthorized
    end
  end

  def create
    @user = login(params[:email], params[:password], params[:remember_me])
    if @user
      session[:user_token] = @user.auth_token
      redirect_to login_path, :notice => "signed in!"
    else
      render "new"
    end
  end

  def destroy
    logout
    render status: :ok
  end
end