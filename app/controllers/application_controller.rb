class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end
  def logged_in?
   !!current_user
  end
  def authorize
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_session_path
    end #end for unless
  end # end for authorize
end # end for class
