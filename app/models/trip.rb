class Trip < ApplicationRecord
  belongs_to :user
  has_many :to_transports
  has_many :there_transports
  has_many :hotels
  has_many :days
  has_many :activities
  has_many :food_drinks
  has_many :budgets
  has_many :ratings

  before_validation :set_defaults

  private

  def set_defaults
    self.user_id = User.first.id if user.blank?
    self.activity_budget = 0 if activity_budget.blank?
    self.food_drink_budget = 0 if food_drink_budget.blank?
    self.comment = "no comment yet" if comment.blank?
  end

end
