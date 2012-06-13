class EmailsController < ActionController::Base

  def show
    @user = User.find_by_email(params[:id])
    render status: :bad_request unless @user
  end

end