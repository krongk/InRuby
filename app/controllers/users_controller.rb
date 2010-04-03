class UsersController < ApplicationController

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      sendmail  #send email to new user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      render :action => 'new'
    end
  end

  def sendmail
    recipient = self.current_user.email
    subject = "Welcome to inRuby"
    message = "<p>Hello,#{self.current_user.login}</p><p>thank you for signing up on inruby.com.</p><p>We specialized in web development, software design. Services for your business is our greatest pleasure. We will respond as quickly as your needs, thank you!</p><p>Tel: +86 15928661802</p><p>Email: kenrome@gmail.com</p><p>Welcome once again to visit <a href='http://www.inruby.com'>inRuby Network</a></p>"
    Emailer.deliver_contact(recipient, subject, message)
   end
end
