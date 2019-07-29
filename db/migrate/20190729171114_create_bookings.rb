class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_time
      t.integer :artist_id
      t.integer :venue_id
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
