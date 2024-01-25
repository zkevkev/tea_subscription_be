class Api::V0::Customers::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id]) # could add error handling here
    subscription = Subscription.new(subscription_params, customer: customer.id)

    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def index
  end

  private 

  def subscription_params 
    params.require(:subscription).permit(:title, :price, :status, :frequency, :tea_id)
  end 
end
