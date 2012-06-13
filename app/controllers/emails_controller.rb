class EmailsController < ActionController::Base

  def show
    email = Base64.decode64(params[:id])
    if user = User.find_by_email(email)
      render :json => {user: {email: user.email, user_token: user.user_token}}
    else
      head status: :not_found
    end
  end

end
