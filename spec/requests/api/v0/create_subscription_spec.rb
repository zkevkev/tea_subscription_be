require 'rails_helper'

RSpec.describe 'post request for /customers/:customer_id/subscriptions' do
  context 'with valid parameters' do
    it 'creates a new subscription for the customer' do
      customer = create(:customer)
      tea = create(:tea)

      post "/api/v0/customers/#{customer.id}/subscriptions", params: tea.id, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
    end
  end
end
