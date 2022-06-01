class Api::V1::CustomerController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    render json: CustomerSerializer.new(@customer)
  end

  def create
   customer = Customer.create(customer_params)

   if customer.save
     # session[:user_id] = user.id
     redirect_to "/customer"
   else
     redirect_to "/register"
     flash[:alert] = "Error: #{error_message(user.errors)}"
   end

   private
    def customer_params
      params.permit(:first_name, :email, :last_name, :address)
    end
 end
end
