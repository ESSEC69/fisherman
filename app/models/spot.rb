class Spot < ActiveRecord::Base
  validates :title, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user

  def address
    [street_number, street, postal_code, city].compact.join(" ")
  end

  def address_changed?
    street_number_changed? || street_changed? || postal_code_change? || city_changed?
  end

end
