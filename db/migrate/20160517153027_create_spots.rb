class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :title
      t.string :description
      t.integer :price_per_day
      t.string :street_number
      t.string :street
      t.string :postal_code
      t.string :city
      t.float :latitude
      t.float :longitude
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
