class District < ApplicationRecord
  has_many :quality_controls
  accepts_nested_attributes_for :quality_controls, allow_destroy: true

  validates :name, presence: true

  scope :not_completed, -> { includes(quality_controls: {decrees: :paragraphs})
                               .where('paragraphs.completion_date < ?', Date.current)
                               .where('paragraphs.performed': 0) }
end
