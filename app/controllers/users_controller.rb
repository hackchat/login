class UsersController < ApplicationController
  before_filter :find_user, except: :create

  def show
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user)
      render status: :created
    else
      render status: :bad_request
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
    @user = User.find_by_auth_token(params[:id])
  end

end
