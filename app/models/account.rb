class Account < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  has_many :account_operations
end
