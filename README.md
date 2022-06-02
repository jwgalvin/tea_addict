# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* <h3> Versions needed </h3>
  ruby 2.7.2p137, rails 5.2.8
* <h3> System dependencies </h3>
  <h4> Production </h4>
    gem 'jsonapi-serializer'
  <h4> Development & Test </h4>  
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    gem 'simplecov'
    gem 'shoulda-matchers'
    gem 'factory_bot_rails'
    gem 'faker'
    gem 'rspec-rails'
    gem 'pry'
* Configuration
  bundle install
* Database creation
  rails db:{create, migrate}
* How to run the test suite
  bundle exec rspec
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
    'rails s' to turn on server at localhost:3000/


Play with in post man
<h1> Customer Info endpoint & contract </h1>
![Customer_page](https://user-images.githubusercontent.com/91991440/171723951-5835cc92-8581-4123-a3a5-bdaa31912820.png)
<h1> Create subscription endpoint & contract </h2>
![create_subscription](https://user-images.githubusercontent.com/91991440/171723983-7b2fa8ca-1afd-4514-8d42-ef01a4fd9afd.png)
<h1> Index subscriptions endpoint & contract </h2>
![subscription_index](https://user-images.githubusercontent.com/91991440/171723972-91d266ca-714b-4de5-8195-83735bb0d00c.png)
<h1> Edit subscription endpoint & contract </h2>
![edit_subscriptions](https://user-images.githubusercontent.com/91991440/171723987-16f4751f-ee81-44ad-958c-e353327fb478.png)
