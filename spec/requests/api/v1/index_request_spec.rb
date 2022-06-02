require 'rails_helper'

RSpec.describe "lists all the things" do
  before (:each)    do
    @bob = Customer.create!(first_name: "Bob", last_name: "Marley", email: "1234@rmail.com", address: "1234 address")
    @starter = @bob.subscriptions.create!(title: "starter", price: "$1.25", status: true, frequency: "1 month")
    @novice_kit = @bob.subscriptions.create!(title: "novice", price: "$2.25", status: true, frequency: "1 month")
    @addict = @bob.subscriptions.create!(title: "addict", price: "$20.00", status: true, frequency: "1x a week")
    @earl_grey = Tea.create(title: "Earl Grey", description: "an english one", temperature: 100, brew_time: "5 minutes")
    @sleepy = Tea.create(title: "Sleepy Time", description: "filled with melatonin", temperature: 98, brew_time: "7 minutes")
    @subscription_tea_1 = SubscriptionTea.create(subscription_id: @starter.id, tea_id: @earl_grey.id)
    @subscription_tea_2 = SubscriptionTea.create(subscription_id: @novice_kit.id, tea_id: @sleepy.id)
    @subscription_tea_3 = SubscriptionTea.create(subscription_id: @addict.id, tea_id: @sleepy.id)
  end

  it "lists all subs and has the correct attributes" do
    params = { customer_id: @bob.id }
    headers_2 = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    get "/api/v1/customer/#{@bob.id}/subscribe", headers: headers_2, params: params.to_json

    list = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to be(200)

    expect(list[:data]).to be_a(Array)
    list[:data].each do |sub|
      expect(sub[:attributes]).to have_key(:title)
      expect(sub[:attributes]).to have_key(:price)
      expect(sub[:attributes]).to have_key(:status)
      expect(sub[:attributes]).to have_key(:frequency)
    end
  end

  it "lists all inactive and active subs" do
    params = { customer_id: @bob.id, subscription_id: @starter.id, status: "false" }
    headers = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    put "/api/v1/customer/#{@bob.id}/subscribe", headers: headers, params: params.to_json
    data = JSON.parse(response.body, symbolize_names: true)

    #this search will pull up the enitre list of subscriptions
    params = { customer_id: @bob.id }
    headers_2 = {"CONTENT_TYPE" => "application/json", "Accept" => 'application/json' }
    get "/api/v1/customer/#{@bob.id}/subscribe", headers: headers_2, params: params.to_json

    list = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to be(200)

    expect(list[:data].count).to eq(3)
    expect(list[:data][2][:status]).to eq(nil)
  end
end
