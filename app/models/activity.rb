class Activity < ApplicationRecord
  belongs_to :trip
  has_many :activity_bookings, dependent: :destroy

  validates :duration, inclusion: { in: %w[15mins 30mins 1h 1h30 2h 2h30 3h 3h30 4h 4h30 5h] }
end
