# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destroy
Tea.destroy_all
Customer.destroy_all
Subscription.destroy_all

# Seed data for teas
tea1 = FactoryBot.create(:tea)
tea2 = FactoryBot.create(:tea)
tea3 = FactoryBot.create(:tea)

# Seed data for customers
customer1 = FactoryBot.create(:customer)
customer2 = FactoryBot.create(:customer)
customer3 = FactoryBot.create(:customer)

# Seed data for subscriptions
subscription1 = FactoryBot.create(:subscription, tea: tea1, customer: customer1)
subscription2 = FactoryBot.create(:subscription, tea: tea2, customer: customer2)
subscription3 = FactoryBot.create(:subscription, tea: tea3, customer: customer3)
