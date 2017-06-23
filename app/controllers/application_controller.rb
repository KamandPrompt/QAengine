class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def current_user 
  	return session[:user]
  end

  def authorize 
  	if current_user == nil
  	  	redirect_to root_path
  	end
  end
end
