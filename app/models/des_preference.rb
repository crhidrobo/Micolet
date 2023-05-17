class DesPreference < ApplicationRecord
  belongs_to :preference
  belongs_to :user
  validates :preference_id, presence: true
end
