require 'rails_helper'

RSpec.describe 'post request for /customers/:customer_id/subscriptions' do
  context 'with valid parameters' do
    it 'creates a new subscription for the customer' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = build(:subscription)

      post "/api/v0/customers/#{customer.id}/subscriptions", params: { tea_id: tea.id, title: subscription.title, price: subscription.price, status: subscription.status, frequency: subscription.frequency }.to_json, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

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
      expect(attributes[:title]).to eq(subscription.title)
      expect(attributes[:price]).to eq(subscription.price)
      expect(attributes[:status]).to eq(subscription.status)
      expect(attributes[:frequency]).to eq(subscription.frequency)
      expect(attributes[:tea_id]).to be_a(Integer)
      expect(attributes[:customer_id]).to be_a(Integer)
    end
  end
end
