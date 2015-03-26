# All controllers have the suffixe: Controller
# They should inherit from classes that eventually inherit from ActionController::Base
# Most ikely controlers will inherit from ApplicationController

class AboutController < ApplicationController

  # This is a method defined within AboutController
  # This is called "Action"
  # So the route: get "/about" => "about#index"
  # Will call this method
  def index
  end
end
