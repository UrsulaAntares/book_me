class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :artist_id
      t.string :content
      t.string :image_url
      t.string :video_url

      t.timestamps
    end
  end
end
