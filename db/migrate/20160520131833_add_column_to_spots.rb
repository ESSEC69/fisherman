class AddColumnToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :average_rating, :integer
  end
end
