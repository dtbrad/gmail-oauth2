class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def home
    if current_user
      gmail = Gmail.connect(:xoauth2, current_user.email, current_user.oauth_token)
      @subject = gmail.inbox.emails.last.subject
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
