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
  end

  def destroy
    logout
    render status: :ok
  end

  # def logged_in
  #   # raise params.inspect
  #   if @user = User.find_by_auth_token(params["auth_token"])
  #     render status: :ok
  #   else
  #     render status: :bad_request
  #   end
  # end

  # def logged_in
  #   if current_user && current_user.auth_token == params["auth_token"]
  #     render status: :ok, json: true
  #   else
  #     render status: :ok, json: false
  #   end
  # end

end