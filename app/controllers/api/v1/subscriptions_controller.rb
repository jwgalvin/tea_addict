class Api::V1::SubscriptionsController < ApplicationController

  def create
    customer = Customer.find(params[:customer_id])
    subscribe = Subscription.find(params[:subscription_id])
    tea_maker = Tea.find(params[:tea_id])
    tea_sub = SubscriptionTea.create(subscription_id: subscribe.id, tea_id: tea_maker.id)

    render json: SubscriptionSerializer.new(tea_sub)
  end

  def update
    customer = Customer.find(params[:customer_id])
    tea_sub = SubscriptionTea.find(params[:subscriptiontea_id])
    tea_sub.subscription.update(status: params[:status])
    render json: SubscriptionSerializer.new(tea_sub)
  end
  private

  def subscribe_params
    params.permit(:title, :price, :status, :frequency)
  end
end
