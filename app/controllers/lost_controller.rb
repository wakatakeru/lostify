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
    property.is_lost = true

    # TODO: エラーハンドリング
    property.save

    @lost.current_location = params['lost']['current_location']
    @lost.pickup_location = params['lost']['pickup_location']
    @lost.property_id = property.id

    # TODO: エラーハンドリング
    @lost.save
    redirect_to lost_index_path
  end
end
