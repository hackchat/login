class UsersController < ApplicationController

  def show
    @user = User.find_by_auth_token(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user, should_remember=false)
    else
      render status: :forbidden
    end
  end

  def update
    @user = User.find_by_auth_token(params[:id])
    if @user.update_attributes(params[:user])
      render status: :created, json: true
    else
      render status: :forbidden
    end
  end

  def destroy
    @user = User.find_by_auth_token(params[:id])
    if @user.destroy
      render status: :ok, json: true
    else
      render status: :forbidden
    end
  end

end
