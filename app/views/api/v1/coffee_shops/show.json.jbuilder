json.extract! @coffee_shop, :id, :name, :address, :description
json.image_url url_for(@coffee_shop.photo) if @coffee_shop.photo.attached?
json.reviews @coffee_shop.reviews do |review|
  json.extract! review, :id, :content
end