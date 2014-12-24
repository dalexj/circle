class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome to the inner circle"
    else
      redirect_to login_path, notice: "We could not log you in. Please try again."
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "You've been logged out."
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
