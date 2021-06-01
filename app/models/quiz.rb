class Quiz < ApplicationRecord
  has_many :questions
  validates :title, presence: true
  validates :status, inclusion: { in: %w(live completed unpublished), message: "%{value} is not a valid status" }
end
