require 'rails_helper'

RSpec.describe Host, type: :model do
  describe 'attributes' do
    describe '#name' do
      let(:host) { Organization.create!(name: 'server 1') }
      it 'returns a string' do
        expect(host.name).to eq('server 1')
      end
    end
  end
end
