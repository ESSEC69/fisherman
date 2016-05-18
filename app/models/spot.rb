class Spot < ActiveRecord::Base
  # photo uploads
  mount_uploader :photo, PhotoUploader

  # mapping
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # validation
  validates :title, presence: true

  # associations
  belongs_to :user
  has_many :reviews, through: :bookings

  #private

  def address
    [street_number, street, postal_code, city].compact.join(" ")
  end

  def address_changed?
    street_number_changed? || street_changed? || postal_code_changed? || city_changed?
  end

end
