json.array! @coffee_shops do |coffee_shop|
  json.extract! coffee_shop, :id, :name, :address
end