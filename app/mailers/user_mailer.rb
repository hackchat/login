class UserMailer < ActionMailer::Base
  default from: "melanie.gilman@livingsocial.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
    @user = user
    @url  = t(:password_email)
    mail(:to => user.email,
       :subject => t(:password_reset))
  end
end
