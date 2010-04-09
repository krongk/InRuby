class AdminController < ApplicationController
  before_filter :admin_required
  
  def index
  end

  def user
    @users = User.all(:order=>"updated_at DESC")
  end

  def order
  end

  def gnote
  end

end
