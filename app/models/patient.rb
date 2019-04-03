class Patient < ApplicationRecord
  validates :first_name, :middle_name, :last_name, :visit_date, presence: true

  scope :current_month, -> { where(next_visit_date: Date.today.at_beginning_of_month .. Date.today.at_end_of_month) }

  def current_month?
    current_year = Date.today.year
    next_visit_year = next_visit_date.year

    return if current_year != next_visit_year

    true if Date.today.month == next_visit_date.month
  end
end
