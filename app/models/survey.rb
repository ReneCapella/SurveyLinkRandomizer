class Survey < ApplicationRecord

  # validates :link, presence: true, uniqueness: true

  belongs_to :user
  has_many :participants

end
