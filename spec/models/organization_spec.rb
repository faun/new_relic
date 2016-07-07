require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'attributes' do
    describe '#name' do
      let(:organization) { Organization.create!(name: 'New Relic') }
      it 'returns a string' do
        expect(organization.name).to eq('New Relic')
      end
    end
  end
end
