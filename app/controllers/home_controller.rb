class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    user = current_user
    properties = Property.where(user_id: user.id)
    @losts = properties.select{|p| p.is_lost == true }
    @possesions = properties - @losts
  end
end
