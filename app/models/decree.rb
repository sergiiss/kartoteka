class Decree < ApplicationRecord
  belongs_to :quality_control
  has_many :paragraphs

  validates :name, presence: true

  OPTION = ['По решению УЗО, МЗРБ', 'По предложение МРЭК'].freeze

  enum option: OPTION

  scope :not_completed, -> { includes(:paragraphs)
                               .where('paragraphs.completion_date < ?', Date.current)
                               .where('paragraphs.performed': 0) }
end
