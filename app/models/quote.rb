class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :client

    validates :quote_tva, presence: true
    validates :amount, presence: true
    validates :date, presence: true
end
