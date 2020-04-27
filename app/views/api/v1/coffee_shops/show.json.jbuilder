json.extract! @coffee_shop, :id, :name, :address, :latitude, :longitude, :description
json.image_url 'https://res.cloudinary.com/dtewjoisz/image/upload/' + @coffee_shop.photo.key + '.jpg' if @coffee_shop.photo.attached?
json.reviews @coffee_shop.reviews do |review|
  json.extract! review, :id, :content, :rating
end
