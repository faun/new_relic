require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'attributes' do
    let(:organization) { Organization.create!(name: 'New Relic') }
    let(:event) { described_class.create(payload: 'hello', organization_id: organization.id) }
    it 'has a string' do
      expect(event.payload).to eq 'hello'
    end
  end
end
