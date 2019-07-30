class AddImageUrlToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :image_url, :string
  end
end
