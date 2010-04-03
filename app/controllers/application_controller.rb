# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require "net/http"
require "rexml/document"

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_locale
  
  private
  def set_locale
    # update session if passed
    session[:locale] = params[:locale] if params[:locale]
    # set locale based on session or default
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
