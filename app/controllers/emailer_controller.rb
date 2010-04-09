class EmailerController < ApplicationController
  before_filter :admin_required
  def index
  end

  def sendmail
    if params[:email]
      email = params[:email]
      recipient = email["recipient"]
      subject = email["subject"]
      message = email["message"]
      Emailer.deliver_contact(recipient, subject, message)
      return if request.xhr?
      render :text => "Message sent successfully!<a href='/emailer/sendmail'>continue</a>"
    end
  end
end
