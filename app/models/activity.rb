class Activity < ApplicationRecord
  belongs_to :day
  belongs_to :trip
end