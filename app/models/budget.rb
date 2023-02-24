class Budget < ApplicationRecord
  belongs_to :trip
  has_many :expenses
end
