class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: {minimum: 3}
  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+[\w\-.]*@[a-zA-Z]+\.[a-zA-Z]+\z/, message: "Invalid email address" }
  validates :password, presence: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validate  :password_match

  def password_match
    if password.present? && password_confirmation.present? && password != password_confirmation
      errors.add(:password_confirmation, "does not match password")
    end
  end
end
