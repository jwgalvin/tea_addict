class SubscriptionSerializer
  include JSONAPI::Serializer

  set_type :subscription
  set_id :id
  attributes :tea, :subscription

end
