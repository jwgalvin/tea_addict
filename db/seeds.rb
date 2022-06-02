# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@bob = Customer.create!(first_name: "Bob", last_name: "Marley", email: "1234@rmail.com", address: "1234 address")
@starter = @bob.subscriptions.create!(title: "nooby", price: "$1.25", status: true, frequency: "1 month")
@earl_grey = Tea.create(title: "Earl Grey", description: "an english one", temperature: 100, brew_time: "5 minutes")
@subscription_tea_1 = SubscriptionTea.create(subscription_id: @starter.id, tea_id: @earl_grey.id)
