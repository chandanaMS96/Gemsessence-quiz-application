class User < ApplicationRecord
	has_many :user_contests, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20,  message: "title should have maximum 20 char"}
  validates :name, uniqueness: { message: "title %{value} already exists"}
  validates :phone_num, presence: true, length: { minimum: 10,  message: "title should have minimun 10 numbers"}
  validates :email, presence: true,  uniqueness: { message: "email %{value} already exists"}
  validate :validate_email_pattern


  def validate_email_pattern
    email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    errors.add(:email, "Enter valid email") unless self.email.match(email_regex)
  end

end
