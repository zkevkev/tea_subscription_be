require 'rails_helper'

RSpec.describe 'delete request for /customers/:customer_id/subscriptions/:id' do
  context 'with valid parameters' do
    it 'creates a new subscription for the customer' do
      customer = create(:customer)
      subscription = create(:subscription, customer: customer)

      delete "/api/v0/customers/#{customer.id}/subscriptions/#{subscription.id}", headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(200)

      # try to find subscription by id? Test index endpoint for presence?
    end
  end
end
