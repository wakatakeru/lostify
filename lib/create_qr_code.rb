require 'barby/barcode/qr_code'
require 'barby/outputter/png_outputter'

module CreateQRCode
  class << self
    def get_image(request, token)
      content = "http://#{request.host}:#{request.port.to_s}/lost/new?token=#{token}"
      size = 10
      level = :m
      xdim = 3
      
      qrcode = Barby::QrCode.new(content, size: size, level: level).to_png

      qrcode
    end
  end
end
