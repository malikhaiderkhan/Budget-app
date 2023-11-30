class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { controller_name == 'home' && action_name == 'index' }
end
