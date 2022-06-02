require 'rails_helper'

RSpec.describe "creates all the things" do
  before (:each)    do
    @bob = Customer.create!(first_name: "Bob", last_name: "Marley", email: "1234@rmail.com", address: "1234 address")
    @starter = @bob.subscriptions.create!(title: "nooby", price: "$1.25", status: true, frequency: "1 month")
    @novice_kit = @bob.subscriptions.create!(title: "nooby", price: "$1.25", status: true, frequency: "1 month")
    @earl_grey = Tea.create(title: "Earl Grey", description: "an english one", temperature: 100, brew_time: "5 minutes")
    @sleepy = Tea.create(title: "Sleepy Time", description: "filled with melatonin", temperature: 98, brew_time: "7 minutes")
    @subscription_tea_1 = SubscriptionTea.create(subscription_id: @starter.id, tea_id: @earl_grey.id)
    @subscription_tea_2 = SubscriptionTea.create(subscription_id: @novice_kit.id, tea_id: @sleepy.id)
  end

  it "Turns subscriptions off" do
    params = {customer_id: @bob.id, subscription_id: @starter.id, status: false}
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    put "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params.to_json
    data = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(data[:data][:attributes][:status]).to eq(false)
  end

  it "Turns subscriptions off, then on again" do
    params = {customer_id: @bob.id, subscription_id: @starter.id, status: "false"}
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    put "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params.to_json

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    params_2 = {customer_id: @bob.id, subscription_id: @starter.id, status: "true"}
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    put "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params_2.to_json

    data_2 = JSON.parse(response.body, symbolize_names: true)
    expect(data_2[:data][:attributes][:status]).to eq(true)
  end

  it "Turns sub_1 off, doesn't effect sub_2" do
    params = {customer_id: @bob.id, subscription_id: @starter.id, status: "false"}
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    put "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params.to_json

    data = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)

    params_2 = {customer_id: @bob.id, subscription_id: @novice_kit.id, status: "true"}
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    put "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params_2.to_json

    data_2 = JSON.parse(response.body, symbolize_names: true)
    expect(data_2[:data][:attributes][:status]).to eq(true)
  end
end
