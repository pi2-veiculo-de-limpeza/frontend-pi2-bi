class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UrlApi

  def sign_in(user)
    session[:token] = user["token"]
  end

  def current_token
  	session[:token]
  end

  def user_loggen_in?
	session[:token].present?
  end
end
