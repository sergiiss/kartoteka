class Patient < ApplicationRecord
  validates :first_name, :middle_name, :last_name, :visit_date, presence: true
end
