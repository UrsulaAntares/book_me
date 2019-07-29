# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

Genre.destroy_all
Artist.destroy_all
Booking.destroy_all
Venue.destroy_all


pop = Genre.create(name: "Pop")
Genre.create(name: "Rap")
Genre.create(name: "Hip-Hop")
Genre.create(name: "Indie")
Genre.create(name: "Rock")

lizzo = Artist.create(name: 'Lizzo', description: 'bad ass musician', image_url: 'https://dazedimg-dazedgroup.netdna-ssl.com/1600/azure/dazed-prod/1260/5/1265896.jpg')
ArtistGenre.create(artist: lizzo, genre: pop)

stage = Venue.create(name: '9:30 Club', location: 'Washington, DC', description: 'perfect', category: 'club', capacity: 400)

Booking.create(title: 'American Tour in DC', artist: lizzo, venue: stage, start_date: DateTime.new(2019, 9, 10, 7, 30), end_time: DateTime.new(2019, 9, 10, 11), description: 'See lizzo live!')

ArtistLike.create(artist: lizzo, venue: stage)

Post.create(artist: lizzo, content: 'so excited!')