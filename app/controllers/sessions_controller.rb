class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email:params[:email]
    if user&.authenticate(params[:params])
      sing_in user
      flash[:success]  = "Welcome to the app, #{current_user.name_or_email}!"
      redirect_to root_path
    else
      flash.now[:warning] = "Incorrect email and/or password!"
      render :new
    end
  end

  def destroy
  end
end