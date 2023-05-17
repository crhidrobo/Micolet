class Survey < ApplicationRecord
  has_many :survery_answers
  validates :title, presence: true
  validates :question, presence: true
end
