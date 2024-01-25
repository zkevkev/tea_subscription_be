require 'rails_helper'

RSpec.describe 'delete request for /customers/:customer_id/subscriptions/:id' do
  context 'with valid parameters' do
    it 'creates a new subscription for the customer' do
      customer = create(:customer)
      subscription = create(:subscription, customer: customer)

      delete "/api/v0/customers/#{customer.id}/subscriptions/#{subscription.id}", headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(subscription.status).to eq(2)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)

      data = parsed[:data]

      expect(data).to be_a(Hash)
      expect(data[:type]).to eq('subscription')
      expect(data[:id]).to be_a(String)

      attributes = data[:attributes]

      expect(attributes).to be_a(Hash)
      expect(attributes[:status]).to eq(subscription.status)
    end
  end
end
