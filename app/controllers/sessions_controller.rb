class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])

    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to dashboard_path, notice: 'Login successful'
    else
      flash.alert = 'Invalid name or password'
      render :new
    end
  end

  def destroy
    signout
    redirect_to login_path
  end
end
