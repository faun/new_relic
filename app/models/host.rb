class Host < ActiveRecord::Base
  belongs_to :organization
  has_many :events
end
