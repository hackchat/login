class UsersController < ApplicationController
  before_filter :find_user, only: [:show, :update, :destroy]

  def show
    render status: :bad_request unless @user
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
      auto_login(user)
      session[:user_token] = user.user_token
      redirect_to CHAT_FRONT
    else
      flash[:notice] = "ERROR"
      render "new"
    end
  end

  def update
    if @user.update_attributes(params[:user])
      render status: :no_content
    else
      render status: :bad_request
    end
  end

  def destroy
    if @user.destroy
      render status: :no_content
    else
      render status: :forbidden
    end
  end

  private

  def find_user
    @user = User.find_by_user_token(params[:id])
  end

end
