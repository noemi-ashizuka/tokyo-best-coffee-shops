json.extract! @coffee_shop, :id, :name, :address
json.reviews @coffee_shop.reviews do |review|
  json.extract! review, :id, :content
end