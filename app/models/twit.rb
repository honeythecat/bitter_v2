class Twit < ActiveRecord::Base
  validates :twit, :presence => true
end
