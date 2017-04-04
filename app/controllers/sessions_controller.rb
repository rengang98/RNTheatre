class SessionsController < ApplicationController

  def new

  end

  def create
    if user = login(params[:email], params[:password])
      flash[:notice] = "Login Successful"
      redirect_to root_path
    else
      flash[:notice] = "Wrong Email or password!"
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Log out successful"
    redirect_to root_path
  end

end