require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'attributes' do
    let(:organization) { Organization.create!(name: 'New Relic') }
    let(:host) do
      Host.create!(name: 'server 1', organization: organization)
    end
    let(:event) do
      described_class.create(
        payload: 'hello',
        organization: organization,
        host: host
      )
    end
    it 'has a string' do
      expect(event.payload).to eq 'hello'
    end
  end

  describe '.recent' do
    let(:org1) { Organization.create!(name: 'New Relic') }
    let(:host1) { Host.create!(organization: org1, name: 'server 1') }
    let(:host2) { Host.create!(organization: org1, name: 'server 2') }
    let(:host3) { Host.create!(organization: org1, name: 'server 3') }

    let(:org2) { Organization.create!(name: 'Old Relic') }
    let(:host4) { Host.create!(organization: org2, name: 'server 4') }
    let(:host5) { Host.create!(organization: org2, name: 'server 5') }
    let(:host6) { Host.create!(organization: org2, name: 'server 6') }

    let(:event1) do
      Event.create!(
        organization: org1,
        payload: 'status ok',
        timestamp: Time.now,
        host: host1
      )
    end

    let(:event2) do
      Event.create!(
        organization: org2,
        payload: 'danger',
        timestamp: Time.now,
        host: host4
      )
    end

    let(:event3) do
      Event.create!(
        organization: org1,
        payload: 'status ok',
        timestamp: Time.now,
        host: host2
      )
    end

    let(:event4) do
      Event.create!(
        organization: org1,
        payload: 'status ok',
        timestamp: Time.now,
        host: host3
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
