class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in? #this makes the methods below available to the whole application

  def current_user
    @current_user ||=Chef.find(session[:chef_id]) if session[:chef_id] #by adding @current_user ||--helps the efficiency of the app, otherwise it will hit the database everytime to look up for the current_user
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "Login first to perform such an action"
      redirect_to :back
    end
  end
end
