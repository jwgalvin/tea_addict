class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    subs = customer.subscriptions
    render json: SubscriptionsSerializer.new(subs)
  end

  def create
    customer = Customer.find(params[:customer_id])
    subscribe = customer.subscriptions.create(subscribe_params)
    tea_maker = Tea.find(params[:tea_id])
    tea_sub = SubscriptionTea.create(subscription_id: subscribe.id, tea_id: tea_maker.id)

    render json: SubscriptionSerializer.new(tea_sub)
  end

  def update
    sub = Subscription.find(params[:subscription_id])
    sub.update!(subscribe_params)
    render json: SubscriptionsSerializer.new(sub)
  end

  private

  def subscribe_params
    params.permit(:title, :price, :status, :frequency)
  end
end
