class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { controller_name == 'home' && action_name == 'index' }
  
  def after_sign_in_path_for(_resource)
    categories_path
  end
end
