class AddStartDateDateToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start_date_date, :date     
  end
end
