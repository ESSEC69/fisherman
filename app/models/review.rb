class Review < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence:true
end
