class Paragraph < ApplicationRecord
  belongs_to :decree

  validates :todo, presence: true

  OPTION_FOR_SELECT = ['Не выполнено', 'Выполнено'].freeze

  enum performed: OPTION_FOR_SELECT

  scope :not_completed, -> { where('paragraphs.completion_date < ?', Date.current).where('paragraphs.performed': 0) }
end
