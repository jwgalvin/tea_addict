class Api::V1::Customer::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:id])
    customer_subs = customer.subscriptions
    render json: SubscriptionSerializer.new(customer_subs)
  end
end
