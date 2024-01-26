require 'rails_helper'

RSpec.describe 'delete request for /customers/:customer_id/subscriptions/:id' do
  context 'with valid parameters' do
    it 'creates a new subscription for the customer' do
      customer = create(:customer)
      subscription = create(:subscription, customer: customer)

      patch "/api/v0/customers/#{customer.id}/subscriptions/#{subscription.id}/cancel", headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)

      data = parsed[:data]

      expect(data).to be_a(Hash)
      expect(data[:type]).to eq('subscription')
      expect(data[:id]).to be_a(String)

      attributes = data[:attributes]

      expect(attributes).to be_a(Hash)
      expect(attributes[:title]).to eq(subscription.title)
      expect(attributes[:price]).to eq(subscription.price)
      expect(attributes[:status]).to eq('cancelled')
      expect(attributes[:frequency]).to eq(subscription.frequency)
      expect(attributes[:tea_id]).to be_a(Integer)
      expect(attributes[:customer_id]).to be_a(Integer)
    end
  end
end
