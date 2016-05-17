class RemoveCheckoutFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :checkout, :string
  end
end
