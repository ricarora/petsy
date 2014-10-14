class LoginsController < ApplicationController

# Create a login, aka "log the user in"
  def create
    if user = User.authenticate(params[:username], params[:password])
    # Save the user ID in the session so it can be used in subsequent requests
      session[:current_user_id] = user.id
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
