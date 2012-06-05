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
      render status: :created
    else
      render status: :unauthorized
    end
  end

  def destroy
    logout
    render status: :ok
  end
end