class AddPhotoToSpot < ActiveRecord::Migration
  def change
    add_column :spots, :photo, :string
  end
end
