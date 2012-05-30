class AuthorizationsController < ApplicationController
  def new
  end

  def show
    # Given user x
    # And App Chat
    # Are they authorized for room y
    user = User.find_by_auth_token(params[:token])

  end
end
