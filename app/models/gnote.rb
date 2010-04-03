class Gnote < ActiveRecord::Base
  validates_presence_of     :contact, :message
end
