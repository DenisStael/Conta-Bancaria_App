class Account < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :document_photo, presence: true

  has_many :account_operations
  has_one_attached :document_photo
end
