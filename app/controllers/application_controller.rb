class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :redirect_to_admin

  def redirect_to_admin
    # binding.pry
    redirect_to('/admin') if current_user
  end

end
