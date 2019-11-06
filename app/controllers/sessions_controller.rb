class SessionsController < ApplicationController
  def showLogin
    render :template => '/sessions/login'
  end

  def login
    user = User.find_by_email(params[:email])
    if user && user.password_digest == params[:password]
      session[:user_id] = user.id
      redirect_to "/"
    else
      flash.now[:alert] = "Email or password is invalid"
      render :template => '/sessions/login'
    end
  end
end