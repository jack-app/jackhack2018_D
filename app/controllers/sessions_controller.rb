class SessionsController < ApplicationController
  before_action :unless_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to user
    else
      flash.now[:danger] = "パスワードとメールアドレスが正しくありません。"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
