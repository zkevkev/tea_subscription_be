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

      expect(data).to be_a(Array)
      data.each do |subscription|
        expect(subscription[:type]).to eq('subscription')
        expect(subscription[:id]).to be_a(String)
        
        attributes = subscription[:attributes]
        
        expect(attributes).to be_a(Hash)
        expect(attributes[:title]).to be_a(String)
        expect(attributes[:price]).to be_a(Float)
        expect(attributes[:status]).to be_a(String)
        expect(attributes[:frequency]).to be_a(Integer)
      end
      
      expect(data.first[:attributes][:price]).to eq(subscription1.price)
    end
  end
end
