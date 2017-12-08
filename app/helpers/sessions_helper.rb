module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    #raise params.inspect
  end

  def current_user
    #raise params.inspect
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
