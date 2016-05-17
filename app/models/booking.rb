class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :spot
  validates :checkin, presence: :true
  validates :number_of_day, presence: :true
  validates :number_of_people, presence: :true
end
