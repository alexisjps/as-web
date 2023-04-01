class Invoice < ApplicationRecord
    belongs_to :user
    belongs_to :client
    validates :invoice_tva, presence: true
    validates :amount, presence: true
    validates :date, presence: true
    has_one_attached :cloudinary_file
    # validates :discount, default: 0
end
