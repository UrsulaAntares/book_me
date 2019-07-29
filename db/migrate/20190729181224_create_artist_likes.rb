class CreateArtistLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_likes do |t|
      t.integer :artist_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
