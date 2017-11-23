class LostController < ApplicationController
  def index
  end
  
  def new
    @lost = Lost.new
    @token = params['token']
  end

  def create
    @lost = Lost.new
    token = params['token']
    
    property = Property.where(token: token).first

    @lost.current_location = params['lost']['current_location']
    @lost.pickup_location = params['lost']['pickup_location']
    @lost.property_id = property.id

    # TODO: エラーハンドリング
    @lost.save

    property.is_lost = true
    property.lost_id = @lost.id
    
    # TODO: エラーハンドリング
    property.save
    redirect_to lost_index_path
  end
end
