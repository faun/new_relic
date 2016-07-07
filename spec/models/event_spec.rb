require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'attributes' do
    let(:organization) { Organization.create!(name: 'New Relic') }
    let(:event) { described_class.create(payload: 'hello', organization_id: organization.id) }
    it 'has a string' do
      expect(event.payload).to eq 'hello'
    end
  end

  describe '.recent' do
    let(:org1) { Organization.create!(name: 'New Relic') }
    let(:org2) { Organization.create!(name: 'Old Relic') }

    let(:event1) do
      Event.create!(
        organization: org1,
        payload: 'status ok',
        timestamp: Time.now,
        hostname: 'server 1'
      )
    end

    let(:event2) do
      Event.create!(
        organization: org2,
        payload: 'danger',
        timestamp: Time.now,
        hostname: 'server 2'
      )
    end

    let(:event3) do
      Event.create!(
        organization: org1,
        payload: 'status ok',
        timestamp: Time.now,
        hostname: 'server 3'
      )
    end

    let(:event4) do
      Event.create!(
        organization: org1,
        payload: 'status ok',
        timestamp: Time.now,
        hostname: 'server 3'
      )
    end

    it 'returns events for the organization only' do
      expect(
        described_class.recent(3, org1.id)
      ).to match_array(
        [event1, event3, event4]
      )

      expect(
        described_class.recent(3, org2.id)
      ).to match_array(
        [event2]
      )
    end
  end
end
