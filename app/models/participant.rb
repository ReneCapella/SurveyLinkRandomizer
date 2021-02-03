class Participant < ApplicationRecord
  validates :unique_id, presence: true

  belongs_to :user
  belongs_to :survey
end
