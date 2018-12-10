class HomeController < ApplicationController
  def index
    redirect_to posts_path
    
    #if user_signed_in?
    #    redirect_to posts_path
    #else
    #    redirect_to new_user_session_path
    #end
  end
end
