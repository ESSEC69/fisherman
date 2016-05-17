class Spot < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true

  belongs_to :user
end
