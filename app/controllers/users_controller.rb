class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user)
                         .permit(:email, :password, :password_confirmation))

    if @user.save
      flash[:notice] = "Sign up successful! please log in."
      redirect_to new_session_path
    else
      render action: :new
    end
  end

end