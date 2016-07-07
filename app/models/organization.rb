class Organization < ActiveRecord::Base
  has_many :hosts
  has_many :events
end
