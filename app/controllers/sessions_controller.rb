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
      redirect_to login_path, :notice => "signed in!"
    else
      render "new"
    end
    session[:user_token] = @user.auth_token
  end

  def destroy
    logout
    render status: :ok
  end
end