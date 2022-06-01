class Api::V1::CustomerController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    render json: CustomerSerializer.new(customer)
  end

  # def create
  #  customer = Customer.create(customer_params)
  #  binding.pry
  #  if customer.save
  #   render json: CustomerSerializer.new(customer), status: :created
  #  else
  #   render json: { error: { message: "Error: unable to create customer, try again"}}
  #  end

   private
    def customer_params
      params.permit(:first_name, :email, :last_name, :address)
    end
end
