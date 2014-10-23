class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
helper_method :all_categories

private

  def all_categories
    @categories = Category.all
  end

  def find_user
    @user = User.find_by(id: session[:current_user_id])
  end
end
