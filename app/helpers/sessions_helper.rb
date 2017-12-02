module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    #raise params.inspect
  end
end
