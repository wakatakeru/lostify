class PropertyController < ApplicationController
  before_action :authenticate_user! 
  
  def show
    @property = Property.find(params['id'])

    check_user(@property.user)
    
    if @property.is_lost
      @lost = Lost.find(@property.lost_id)
    end
  end

  def download
    property = Property.find(params['id'])

    check_user(property.user)

    qrcode = CreateQRCode::get_image(request, property.token)
    send_data(qrcode, type: 'image/png')
  end
  
  def new
    @property = Property.new
  end

  def create
    @property = Property.new

    @property.name = params['property']['name']
    @property.user_id = current_user.id
    @property.token = SecureRandom.hex(30)    # とりあえず30にしとけば被らんだろ
    @property.is_lost = false

    if @property.save
      flash[:success] = '物品を正しく登録しました'
      redirect_to home_index_path
    else
      flash[:danger] = '物品名を入力していることを確認してください。'
      render 'new'
    end
  end

  def edit
    @property = Property.find(params['id'])

    check_user(@property.user)
  end

  def update
    property = Property.find(params['id'])

    check_user(property.user)
    
    property.name = params['property']['name']
    property.user_id = current_user.id

    if property.save
      flash[:success] = '物品を正しく登録しました'
      redirect_to home_index_path
    else
      flash[:danger] = '物品名を入力していることを確認してください。'
      render 'new'
    end
  end

  def destroy
    property = Property.find(params['id'])

    check_user(property.user)
    
    if property.destroy
      flash[:success] = '物品を削除しました'
      redirect_to home_index_path
    else
      flash[:danger] = '物品を削除できません。管理者にお問い合わせください'
      redirect_to home_index_path
    end
  end

  def destroy_reporting
    property = Property.find(params['id'])
    lost = Lost.find(property.lost_id)

    property.lost_id = nil
    property.is_lost = false
    property.token = SecureRandom.hex(30)    # 一回拾得報告されたらQRコードを更新
    
    if lost.destroy && property.save
      flash[:success] = '物品の受取を登録しました'
      redirect_to home_index_path
    else
      flash[:danger] = '登録を削除できません。管理者にお問い合わせください'
      redirect_to home_index_path
    end
  end

  private

  def check_user(user)
    if user != current_user
      flash[:danger] = '権限の無い操作です'
      redirect_to home_index_path
    end
  end
end
