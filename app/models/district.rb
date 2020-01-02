class District < ApplicationRecord
  validates :name, :decree_date, :completion_date, :performed, presence: true

  enum performed: ['Не выполнено', 'Выполнено']

  def current_month?
    current_year = Date.today.year
    next_visit_year = completion_date.year

    return if current_year != next_visit_year

    true if Date.today.month == completion_date.month
  end
end
