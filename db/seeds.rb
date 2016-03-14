# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(
           title: 'Hello, niggaz!',
           description: %{Swagga book for swagga dudes.},
           image_url: "http://png-images.ru/wp-content/uploads/2015/01/book_PNG2116.png",
           price: 1488.228
)
Product.create(
    title: 'Hello, yankies!',
    description: %{Something interesting for you. Something interesting for you. Something interesting for you. Something interesting for you. Something interesting for you.},
    image_url: "http://orig10.deviantart.net/d887/f/2012/070/8/1/dinosaurio_png_____by_eriieditions-d4se5zh.png",
    price: 128
)
Product.create(
    title: 'Megapolis',
    description: %{Book about the big city.},
    image_url: "http://vignette1.wikia.nocookie.net/fringe/images/9/9f/FBISeal.png/revision/latest?cb=20090923095647&path-prefix=ru",
    price: 7.55
)
Product.create(
    title: 'Killimanjaro',
    description: %{The highest mountain in the world.},
    image_url: "http://img12.deviantart.net/65e4/i/2013/003/6/6/png_floating_terrain_by_moonglowlilly-d5qb58m.png",
    price: 12.30
)