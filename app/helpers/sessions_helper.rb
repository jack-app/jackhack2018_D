module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end
  def logout
    session.delete :user_id
    @current_user = nil
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end
  def require_login
    redirect_to login_url unless logged_in?
  end
  def unless_login
    redirect_to account_path if logged_in?
  end
end
