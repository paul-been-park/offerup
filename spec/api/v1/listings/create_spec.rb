require 'rails_helper'

RSpec.describe "listings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/listings", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'listings',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ListingResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Listing.count }.by(1)
    end
  end
end
