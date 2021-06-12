class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user&.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "login success"
      redirect_to root_path
    else
      flash[:danger] = "login failed"
      render 'new'
    end
  end

  def destroy
    flash[:success] = "logout success"
    session[:user_id] = nil
    redirect_to login_path
  end

end
