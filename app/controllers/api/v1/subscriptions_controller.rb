class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    customer_subs = customer.subscriptions
    binding.pry
    render json: SubscriptionSerializer.new(customer_subs)
  end

  def create
    binding.pry
    customer = Customer.find_by(params[:customer_id])
    subscription = customer.Subscription.create(subscribe_params)
  end


  private

  def subscribe_params
    params.permit(:title, :price, :status, :frequency)
  end
end
