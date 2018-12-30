class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    books_url
  end
  
  def after_sign_out_path_for(resource)
    books_url
  end

end
