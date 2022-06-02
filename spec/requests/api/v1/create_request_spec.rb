require 'rails_helper'

RSpec.describe "creates all the things" do
  before (:each)    do
    @bob = Customer.create!(first_name: "Bob", last_name: "Marley", email: "1234@rmail.com", address: "1234 address")
    @starter = @bob.subscriptions.create!(title: "nooby", price: "$1.25", status: true, frequency: "1 month")
    @earl_grey = Tea.create(title: "Earl Grey", description: "an english one", temperature: 100, brew_time: "5 minutes")
    @sleepy = Tea.create(title: "Sleepy Time", description: "filled with melatonin", temperature: 98, brew_time: "7 minutes")
  end

  it "creates a subscription" do
    params = {customer_id: @bob.id, tea_id: @earl_grey.id, subscription_id: @starter.id }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    post "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params.to_json
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(data[:data]).to have_key(:id)
    expect(data[:data]).to have_key(:type)
    expect(data[:data]).to have_key(:attributes)
    expect(data[:data][:attributes]).to have_key(:tea)
    expect(data[:data][:attributes]).to have_key(:subscription)
  end
end
