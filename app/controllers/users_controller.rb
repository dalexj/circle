class UsersController < ApplicationController
  before_action :current_user, only: [:show, :update, :edit]
  before_action :require_admin, except: [:new, :create, :edit, :show, :update]
  before_action :correct_user, except: [:index, :destroy, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to bench_path
    else
      flash[:error] = "Invalid sign-up. Try again."
      render :back
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :name, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user == @user
  end
end
