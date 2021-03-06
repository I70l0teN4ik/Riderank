class SessionsController < ApplicationController
  def new
  end

  def create
    puts params[:email]
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
