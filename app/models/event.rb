class Event < ActiveRecord::Base
  belongs_to :host
  belongs_to :organization
  validates_associated :organization
  validates :organization, presence: true

  def self.recent(count, org_id)
    limit = Integer(count)
    org = Integer(org_id)
    where(organization_id: org)
      .order('timestamp ASC')
      .limit(limit)
  end

  def self.by_host(count, host_id, org_id)
    limit = Integer(count)
    where(organization_id: org_id.to_i, host_id: host_id)
      .order('timestamp ASC')
      .limit(limit)
  end
end
