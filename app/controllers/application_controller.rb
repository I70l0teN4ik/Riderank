class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_user
    redirect_to '/login' unless current_user
  end

end
