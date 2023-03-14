class Invoice < ApplicationRecord
    belongs_to :user
    belongs_to :client
    # validates :discount, default: 0
    validates :invoice_tva, presence: true
    validates :amount, presence: true
    validates :date, presence: true
end
