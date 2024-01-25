require 'rails_helper'

RSpec.describe 'post request for /customers/:customer_id/subscriptions' do
  context 'with valid parameters' do
    it 'creates a new subscription for the customer' do
      customer = create(:customer)
      tea = create(:tea)

      post "/api/v0/customers/#{customer.id}/subscriptions", params: tea.id, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)

      data = parsed[:data]

      expect(data).to be_a(Hash)
      expect(data[:type]).to eq('subscription')
      expect(data[:id]).to be_a(String)

      attributes = data[:attributes]

      expect(attributes).to be_a(Hash)
      expect(attributes[:title]).to be_a(String)
      expect(attributes[:price]).to be_a(Float)
      expect(attributes[:status]).to be_a(Integer)
      expect(attributes[:frequency]).to be_a(Integer)
    end
  end
end
