require 'rails_helper'

RSpec.describe 'get request for /customers/:customer_id/subscriptions' do
  context 'with valid parameters' do
    it 'returns all subscriptions for a customer' do
      customer = create(:customer)
      subscription1 = create(:subscription, customer: customer)
      subscription2 = create(:subscription, customer: customer)
      subscription3 = create(:subscription)

      get "/api/v0/customers/#{customer.id}/subscriptions", headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)

      data = parsed[:data]

      expect(data).to be_a(Hash)
      expect(data[:type]).to eq('') # this will be subscriptions?
      expect(data[:id]).to be_a(String)

      attributes = data[:attributes]

      expect(attributes).to be_a(Hash)
      attributes.each do |subscription|
        expect(subscription[:title]).to be_a(String)
        expect(subscription[:price]).to be_a(Float)
        expect(subscription[:status]).to be_a(Integer)
        expect(subscription[:frequency]).to be_a(Integer)
      end
      expect(attributes.first[:title]).to eq(subscription1.title)
      expect(attributes.first[:price]).to eq(subscription1.price)
      expect(attributes.first[:status]).to eq(subscription1.status)
      expect(attributes.first[:frequency]).to eq(subscription1.frequency)
      expect(attributes.length).to eq(2)
    end
  end
end
