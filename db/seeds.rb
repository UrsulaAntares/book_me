require 'date'
require 'faker'

Genre.destroy_all
Artist.destroy_all
# Booking.destroy_all
Venue.destroy_all
Post.destroy_all

#Users
admin = User.create(username: 'admin', password: 'admin')
lovemusic = User.create(username: 'lovemusic', password: "password")
mlam = User.create(username: 'mlam', password: 'password')
cooluser = User.create(username: "cooluser", password: 'password')
joe123 = User.create(username: 'joe123', password: 'password')
frank = User.create(username: 'frank', password: 'password')
janet = User.create(username: 'janet', password: 'password')
alison = User.create(username: 'alison', password: 'password')
bob = User.create(username: 'bob', password: 'password')
kevin = User.create(username: 'kevin', password: 'password')
angela = User.create(username: 'angela', password: 'password')
luceille = User.create(username: 'luceille', password: 'password')

pop = Genre.create(name: "Pop")
rap = Genre.create(name: "Rap")
hh = Genre.create(name: "Hip-Hop")
ind = Genre.create(name: "Indie")
rock = Genre.create(name: "Rock")
emo = Genre.create(name: "Emo")
folk = Genre.create(name: "Folk")
instr = Genre.create(name: "Instrumental")
trapmusic = Genre.create(name: "Trap")
soul = Genre.create(name: "Soul")

lizzo = Artist.create(name: 'Lizzo', description: 'bad ass musician', image_url: 'https://dazedimg-dazedgroup.netdna-ssl.com/1600/azure/dazed-prod/1260/5/1265896.jpg')
db = Artist.create(name: 'Dave Berman', description: 'twangy emo', image_url: 'https://static.spin.com/files/2019/05/Screen-Shot-2019-05-10-at-10.41.52-AM-1557499348-640x339.png')
a = Artist.create(name:'Lucius', description: 'Alien folk-pop', image_url:'https://image-ticketfly.imgix.net/00/02/83/92/04-og.jpg' ) 
b = Artist.create(name:'Sam Cooke', description: '', image_url:'https://e-cdns-images.dzcdn.net/images/artist/da87d69a29ce6860f09f7070c060a139/500x500.jpg' ) 

lizzo.genres << pop
db.genres << ind
a.genres << folk << ind << pop

Genre.all.each do |genre|
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'http://www.badtouchrocks.co.uk/wp-content/uploads/2018/08/BAD-TOUCH-N-EDIT-53-796x1024.jpg' )}
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'https://www.rollingstone.com/wp-content/uploads/2018/10/lindsey-buckingham-sues-the-mac.jpg' )}
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'https://i.ytimg.com/vi/w_B1N4Y0p8I/hqdefault.jpg' )}
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'https://nyoobserver.files.wordpress.com/2017/04/pinegrove-by-phillip-randall.jpg' )}
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'https://www.irishtimes.com/polopoly_fs/1.3759020.1547743279!/image/image.jpg_gen/derivatives/box_620_330/image.jpg' )}
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'http://www.herenow.city/assets/uploads/sites/8/2016/09/01.jpg' )}
    1.times {Artist.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), image_url: 'http://la.thedelimagazine.com/sites/upload-files/2r7u0012.jpg' )}
end

mlam.artists << lizzo << a
lovemusic.artists << db << lizzo
cooluser.artists << b


ninethirty= Venue.create(name: '9:30 Club', location: 'U Street', description: 'perfect', category: 'club', capacity: 400, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/construction-corners_0002_Soft-100_0.jpg?itok=gLBhC4kK")
rnr = Venue.create(name: 'Rock & Roll Hotel', location: 'Atlas District', description: 'Divey', category: 'club', capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/germany-venetian-blinds_0007_Pin-70.jpg?itok=KElJBATB")
anthem = Venue.create(name: 'Anthem', location: 'The Wharf', description: 'Ideal', category: 'club', capacity: 600)
uhaul = Venue.create(name: 'U Haul', location: 'U Srteet', description: 'Basement dance party', category: 'club', capacity: 200, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/wilkesbarre-house-1_0008_alignedsoft.jpg?itok=ic43BKZh")
blackcat = Venue.create(name: 'Black Cat', location: 'Logan Circle', description: 'Ye Olde', category: 'club', capacity: 300)
songbird= Venue.create(name: 'Songbird', location: 'Atlas District', description: 'tiny basement', category: 'club', capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/wilkesbarre-house-1_0008_alignedsoft.jpg?itok=ic43BKZh")
dc9 = Venue.create(name: 'DC9', location: 'U Street', description: 'Divey', category: 'club', capacity: 100)
bohem = Venue.create(name: 'Bohemian Caverns', location: 'U Street', description: 'Dinner theater style', category: 'dinner theater', capacity: 200)
hamilton = Venue.create(name: 'Hamilton', location: 'Downtown', description: 'Dinner and bar areas', category: 'dinner theater', capacity: 300, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/admo-door-box-2_0013_Hard-50.jpg?itok=JzRgQMAI")


LOCATIONS = ["Downtown", "Mount Pleasant", "Bloomingdale", "Columbia Heights", "U Street", "Logan Circle", "Brightwood", "Brookland", "Edgewood", "THe Wharf", "Adams Morgan", "Atlas District"]

LOCATIONS.each do |location|
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/construction-corners_0002_Soft-100_0.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/germany-venetian-blinds_0007_Pin-70.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/wilkesbarre-house-1_0008_alignedsoft.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/admo-door-box-2_0013_Hard-50.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/winsows-white_0010_Soft-100.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/zip-balconies-prism_0003_Linear-50.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/baltimore-roofs-diagonal_0009_Hard-100_0.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/balconies-14th-street-1_0002_Hard-100.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/porches-1_0011_some.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/combo-corners-1_0006_2.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100, image_url: "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/mouth-boat_0009_halfhalf_0.jpg")
    }
    1.times {
        Venue.create(name: Faker::Hipster.words(number: 2).join(' ').titleize, description: Faker::Hipster.sentences.join(' '), 
        location: location, category: Faker::Hipster.words(number: 2).join(' '), capacity: 100)
    }
end

Venue.all.each {|v| admin.venues << v }


mlam.venues << anthem << uhaul
# mlam.venues << uhaul
lovemusic.venues << dc9 << blackcat
# lovemusic.venues << blackcat
cooluser.venues << songbird << hamilton 
joe123.venues << bohem << rnr



Booking.create(title: 'American Tour in DC', artist: lizzo, venue: ninethirty, start_date: DateTime.new(2019, 9, 10, 19, 30), 
    end_time: DateTime.new(2019, 9, 10, 21), description: 'See lizzo live!')
Booking.create(title: 'Purple Mountain Tour', artist: db, venue: blackcat, start_date: DateTime.new(2019, 8, 13, 19, 30), 
    end_time: DateTime.new(2019, 8, 13, 21), description: 'New Album Release')
Booking.create(title: "Don't call it a comeback", artist: db, venue: anthem, start_date: DateTime.new(2019, 8, 3, 19, 30), 
    end_time: DateTime.new(2019, 8, 3, 21), description: 'It costs 25 cents to wake up in the morning.')
Booking.create(title: 'Taking the flute to the people', artist: lizzo, venue: anthem, start_date: DateTime.new(2019, 8, 20, 19, 30), 
    end_time: DateTime.new(2019, 8, 20, 21), description: 'Flutes flutes flutes')


Venue.all.each do |venue|
    1.times {Booking.create(title: Faker::Hipster.words(number: 3).join(' ').titleize, artist: Artist.all.shuffle.first, venue: venue, start_date: DateTime.new(2019, 8, 20, 19, 30), end_time: DateTime.new(2019, 8, 20, 19, 30), 
    description: Faker::Hipster.sentences.join(' '))}
end


Venue.all.each do |venue|
    3.times {ArtistLike.create(artist: Artist.all.shuffle.first, venue: venue)}
end


Artist.all.each do |artist|
    3.times {Post.create(artist: artist, content: Faker::Hipster.sentences.join(' '))}
end


Post.create(artist: lizzo, content: 'so excited!')
Post.create(artist: db, content: 'no comment.')

# <!--also add user likes artists-->