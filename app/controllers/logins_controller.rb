class LoginsController < ApplicationController

  def new
    render :new
  end

  def current_user
    User.find_by(username: params[:user][:username])
  end

# Create a login, aka "log the user in"
  def create
    # raise params.inspect
    if current_user && current_user.authenticate(params[:user][:password])
    # Save the user ID in the session so it can be used in subsequent requests
      session[:current_user_id] = current_user.id
      redirect_to "/users/test"
    else
      render :new
    end
  end

# returns the user associated with the current session
  def show
    @user = User.find(session[:current_user_id])
  end

# Log off the user
  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_path
  end

end