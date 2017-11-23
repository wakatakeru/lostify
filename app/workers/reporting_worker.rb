class ReportingWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default
  
  def perform(user_email, property_name, current_loc, pickup_loc)
    ReportingMailer.report_email(user_email, property_name, current_loc, pickup_loc).deliver
    p "MailSending!"
  end
end
