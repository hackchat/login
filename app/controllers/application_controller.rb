class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def redirect_chat
    if Rails.env.production?
      "http://hackchat.in"
    else
      "http://localhost:2000"
    end
  end

end
