# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "destroying instances..."

Review.destroy_all
CoffeeShop.destroy_all
User.destroy_all

puts "creating users"

noemi = User.create!(
  email: "noemi@mail.com",
  password: "123456"
)

masa = User.create!(
  email: "masa@mail.com",
  password: "123456"
)

puts "creating coffee shops"

kohaze = CoffeeShop.create!(
  name: "Kohaze",
  address: "〒155-0031 東京都世田谷区北沢２丁目３３−6",
  description: "Distillery chillwave tumeric meggings hella vegan. Cold-pressed tbh butcher, shaman mustache leggings selvage thundercats drinking vinear banjo. Fashion axe shaman disrupt normcore slow-carb biodiesel vegan gastropub palo santo succulents crucifix kogi. Poke retro enamel pin, narwhal beard four dollar toast you probably haven't heard of them small batch taiyaki tousled. Pop-up knausgaard meditation blog selfies, trust fund etsy.\r\n\r\nWayfarers live-edge scenester health goth readymade. Viral taiyaki semiotics DIY, pitchfork sriracha chia. Messenger bag DIY freegan actually lumbersexual single-origin coffee dreamcatcher activated charcoal green juice tumblr adaptogen tacos. Flexitarian kickstarter iceland, crucifix hella pabst bespoke palo santo.",
  user: noemi
)
file = URI.open("https://res.cloudinary.com/dtewjoisz/image/upload/v1589188002/cafes/kohaze_divbfu.jpg")
kohaze.photo.attach(io: file, filename: "kohaze.jpg", content_type: 'image/jpg')

milky = CoffeeShop.create!(
  name: "Milky Way",
  address: "〒170-0013 東京都豊島区東池袋１丁目１２−8 富士喜ビル",
  description: "Pour-over copper mug selvage, actually affogato narwhal occupy plaid sustainable XOXO af. Blue bottle meh green juice vegan humblebrag fam synth affogato master cleanse activated charcoal occupy church-key cold-pressed bitters. Leggings normcore adaptogen chillwave direct trade four dollar toast. Leggings art party post-ironic flannel. Offal kale chips chillwave enamel pin selfies cold-pressed iPhone everyday carry schlitz. Celiac keffiyeh edison bulb 8-bit sustainable marfa affogato meditation put a bird on it forage pork belly.\r\n\r\nPinterest truffaut pitchfork succulents intelligentsia, lumbersexual kinfolk everyday carry meggings sriracha flannel edison bulb plaid vaporware echo park. Lumbersexual street art enamel pin semiotics health goth, photo booth raclette kale chips literally prism keffiyeh aesthetic chartreuse 8-bit occupy.",
  user: noemi
)
file = URI.open("https://res.cloudinary.com/dtewjoisz/image/upload/v1589188043/cafes/milky_zp0r2l.jpg")
milky.photo.attach(io: file, filename: "milky.jpg", content_type: 'image/jpg')

norah = CoffeeShop.create!(
  name: "Norah's Coffee Table",
  address: "Tokyo, Setagaya City, Kitazawa, 2 Chome−26−25",
  description: "Pour-over copper mug selvage, actually affogato narwhal occupy plaid sustainable XOXO af. Blue bottle meh green juice vegan humblebrag fam synth affogato master cleanse activated charcoal occupy church-key cold-pressed bitters. Leggings normcore adaptogen chillwave direct trade four dollar toast. Leggings art party post-ironic flannel. Offal kale chips chillwave enamel pin selfies cold-pressed iPhone everyday carry schlitz. Celiac keffiyeh edison bulb 8-bit sustainable marfa affogato meditation put a bird on it forage pork belly.\r\n\r\nPinterest truffaut pitchfork succulents intelligentsia, lumbersexual kinfolk everyday carry meggings sriracha flannel edison bulb plaid vaporware echo park. Lumbersexual street art enamel pin semiotics health goth, photo booth raclette kale chips literally prism keffiyeh aesthetic chartreuse 8-bit occupy.",
  user: masa
)
file = URI.open("https://res.cloudinary.com/dtewjoisz/image/upload/v1589188011/cafes/norah_vwuzbp.jpg")
norah.photo.attach(io: file, filename: "norah.jpg", content_type: 'image/jpg')

bake = CoffeeShop.create!(
  name: "Bake Shop",
  address: "152-0035 Tokyo, Meguro , Jiyugaoka",
  description: "Fixie iceland lumbersexual, farm-to-table wolf occupy ramps kombucha enamel pin post-ironic iPhone +1 pork belly. Austin butcher echo park, umami green juice poutine stumptown try-hard godard venmo adaptogen. Pickled occupy disrupt leggings try-hard. Cardigan listicle everyday carry authentic leggings. Meditation chambray vegan, hoodie cardigan listicle brunch. Gastropub cardigan aesthetic waistcoat you probably haven't heard of them cronut raw denim. Photo booth selfies try-hard affogato.",
  user: masa
)
file = URI.open("https://res.cloudinary.com/dtewjoisz/image/upload/v1589187974/cafes/bake_vngajx.jpg")
bake.photo.attach(io: file, filename: "bake.jpg", content_type: 'image/jpg')
