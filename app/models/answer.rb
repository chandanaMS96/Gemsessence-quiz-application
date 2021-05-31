class Answer < ApplicationRecord
  validates :body
  validates :question_id, presence: true
end
