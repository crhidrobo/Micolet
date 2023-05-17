class Preference < ApplicationRecord
  has_many :des_preferences
  validates :preference, presence: true
  validates :description, presence: true
end
