class AddColumnsToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :number_of_people, :integer
    add_column :bookings, :number_of_day, :integer
    add_column :bookings, :price, :integer
  end
end
