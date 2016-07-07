class Event < ActiveRecord::Base
  belongs_to :host
  belongs_to :organization
end
