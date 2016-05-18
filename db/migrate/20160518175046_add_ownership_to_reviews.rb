class AddOwnershipToReviews < ActiveRecord::Migration
  def change
     add_column :reviews, :ownership, :boolean
  end
end
