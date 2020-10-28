class AccountOperation < ApplicationRecord

    validates :value, presence: true
    validates :operation, presence: true

    belongs_to :account

end
