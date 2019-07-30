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
rap = Genre.create(name: "Rap")
hh = Genre.create(name: "Hip-Hop")
ind = Genre.create(name: "Indie")
rock = Genre.create(name: "Rock")

lizzo = Artist.create(name: 'Lizzo', description: 'bad ass musician', image_url: 'https://dazedimg-dazedgroup.netdna-ssl.com/1600/azure/dazed-prod/1260/5/1265896.jpg')
db = Artist.create(name: 'Dave Berman', description: 'twangy emo', image_url: 'https://static.spin.com/files/2019/05/Screen-Shot-2019-05-10-at-10.41.52-AM-1557499348-640x339.png')



ninethirty= Venue.create(name: '9:30 Club', location: 'U Street', description: 'perfect', category: 'club', capacity: 400)
rnr = Venue.create(name: 'Rock & Roll Hotel', location: 'Atlas District', description: 'Divey', category: 'club', capacity: 100)
anthem = Venue.create(name: '9:30 Club', location: 'The Wharf', description: 'Ideal', category: 'club', capacity: 600)
uhaul = Venue.create(name: 'U Haul', location: 'U Srteet', description: 'Basement dance party', category: 'club', capacity: 200)
blackcat = Venue.create(name: 'Black Cat', location: 'Logan Circle', description: 'Ye Olde', category: 'club', capacity: 300)


Booking.create(title: 'American Tour in DC', artist: lizzo, venue: ninethirty, start_date: DateTime.new(2019, 9, 10, 19, 30), 
    end_time: DateTime.new(2019, 9, 10, 21), description: 'See lizzo live!', start_date_date: DateTime.new(2019, 9, 10, 11))
Booking.create(title: 'Purple Mountain Tour', artist: db, venue: blackcat, start_date: DateTime.new(2019, 8, 13, 19, 30), 
    end_time: DateTime.new(2019, 8, 13, 21), description: 'New Album Release', start_date_date: Date.new(2019, 8, 13))
Booking.create(title: "Don't call it a comeback", artist: db, venue: anthem, start_date: DateTime.new(2019, 8, 3, 19, 30), 
    end_time: DateTime.new(2019, 8, 3, 21), description: 'It costs 25 cents to wake up in the morning.', start_date_date: Date.new(2019, 8, 3,))
Booking.create(title: 'Taking the flute to the people', artist: lizzo, venue: anthem, start_date: DateTime.new(2019, 8, 20, 19, 30), 
    end_time: DateTime.new(2019, 8, 20, 21), description: 'Flutes flutes flutes', start_date_date: Date.new(2019, 8, 20))

ArtistLike.create(artist: lizzo, venue: ninethirty)
ArtistLike.create(artist: lizzo, venue: blackcat)
ArtistLike.create(artist: lizzo, venue: uhaul)
ArtistLike.create(artist: db, venue: rnr)
ArtistLike.create(artist: db, venue: anthem)
ArtistLike.create(artist: db, venue: ninethirty)
ArtistLike.create(artist: db, venue: blackcat)
ArtistLike.create(artist: db, venue: uhaul)
ArtistLike.create(artist: lizzo, venue: rnr)
ArtistLike.create(artist: lizzo, venue: anthem)

Post.create(artist: lizzo, content: 'so excited!')
Post.create(artist: db, content: 'no comment.')
