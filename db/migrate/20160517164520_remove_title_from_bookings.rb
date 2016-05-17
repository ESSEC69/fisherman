class RemoveTitleFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :title, :string
  end
end
