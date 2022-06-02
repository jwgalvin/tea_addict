class SubscriptionsSerializer
  include JSONAPI::Serializer

  set_type :subscription
  set_id :id
  attributes :title, :price, :status, :frequency

end
