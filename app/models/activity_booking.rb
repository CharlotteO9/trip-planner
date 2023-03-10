class ActivityBooking < ApplicationRecord
  belongs_to :activity
  belongs_to :day
end
