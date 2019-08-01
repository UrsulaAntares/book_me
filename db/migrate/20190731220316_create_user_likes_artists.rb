class CreateUserLikesArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes_artists do |t|
      t.integer :user_id
      t.integer :artist_id
      t.string :review

      t.timestamps
    end
  end
end
