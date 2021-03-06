class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  before_filter :redirect_to_dashboard, only: [:new, :create]

  def dashboard
    @permissions = current_user.permissions.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      signin(@user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def redirect_to_dashboard
    redirect_to dashboard_path if signed_in?
  end
end
