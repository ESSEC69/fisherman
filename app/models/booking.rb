class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot
  validates :checkin, presence: :true
  validates :checkout, presence: :true

end
