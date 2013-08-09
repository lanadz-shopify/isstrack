class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_to_admin
    # binding.pry
    redirect_to('/admin') if current_user
  end

end
