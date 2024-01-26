class Api::V0::Customers::SubscriptionsController < ApplicationController
  def create
    customer = Customer.find(params[:customer_id]) # could add error handling here
    subscription = Subscription.new(subscription_params)

    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors }, status: :unprocessable_entity # this should use the serializer
      # render json: ErrorSerializer.new(ErrorMessage.new(subscription.errors, 400))
      # .error_json, status: :unprocessable_entity
    end
  end

  def destroy
    subscription = Subscription.find(params[:id])

    if subscription.status == 1
      subscription.update!({ status: 2 })
      render json: SubscriptionSerializer.new(subscription), status: :ok
    else
      render json: { errors: 'subscription is already cancelled' }, status: :unprocessable_entity
    end
  end

  def index
  end

  private 

  def subscription_params 
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end 
end
