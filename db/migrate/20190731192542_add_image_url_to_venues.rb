class AddImageUrlToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :image_url, :string, :default => "http://isneat.net/sites/isneat.net/files/styles/portfolio_650xauto/public/greenhouse-2_0029_SoftAlignedDark_0.jpg"
  end
end
