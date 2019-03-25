class User < ApplicationRecord
  validates :first_name, :middle_name, :last_name, presence: true
end
