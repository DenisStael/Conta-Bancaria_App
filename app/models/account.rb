class Account < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }

  private
    def new_account_number
        Faker::Bank.unique.account_number(digits: 5)
    end

    def new_numeric_password
        Faker::Number.unique.number(digits: 6)
    end
end
