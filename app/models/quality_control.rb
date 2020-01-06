class QualityControl < ApplicationRecord
  belongs_to :district
  has_many :decrees

  scope :not_completed, -> { includes(decrees: :paragraphs)
                               .where('paragraphs.completion_date < ?', Date.current)
                               .where('paragraphs.performed': 0) }
end