class ReportingMailer < ApplicationMailer
  def report_email(user_email, property_name, current_loc, pickup_loc)
    @user_email = user_email
    @property_name = property_name
    @current_loc = current_loc
    @pickup_loc = pickup_loc
    mail(to: @user_email, subject: '[重要] 所持品が拾得されました')
  end
end
