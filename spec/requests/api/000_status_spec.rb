require 'rails_helper'

describe 'Status API' do

  describe 'show' do
    before { get '/status' }

    it { expect(response).to be_success }

    it 'should return a message indicating the service is available' do
      expect(json['status']).to eql('Everything is working!')
    end
  end
end
