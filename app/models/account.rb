class Account < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :document_photo, presence: true

  has_many :account_operations
  has_one_attached :document_photo
end
