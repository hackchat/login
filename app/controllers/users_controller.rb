class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      auto_login(@user, should_remember=false)
      redirect_to login_path, :notice => "Signed up!"
    else
      render :new
    end
  end
end
