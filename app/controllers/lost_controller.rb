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

    if !(property.present?)
      flash[:danger] = "このQRコードは無効です" 
      redirect_to lost_index_path
    else
      property_name = property.name

      user_email = User.find(property.user_id).email
      
      # TODO: エラーハンドリング
      @lost.current_location = params['lost']['current_location']
      @lost.pickup_location = params['lost']['pickup_location']
      @lost.property_id = property.id
      @lost.save

      property.is_lost = true
      property.lost_id = @lost.id
      current_loc = @lost.current_location
      pickup_loc = @lost.pickup_location
      property.save

      ReportingMailer.report_email(
        user_email,
        property_name,
        current_loc,
        pickup_loc
      ).deliver!
      #ReportingWorker.perform_async(user_email, property_name, current_loc, pickup_loc)
      
      redirect_to lost_index_path
    end
  end
end
