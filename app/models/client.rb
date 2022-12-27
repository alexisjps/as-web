class Client < ApplicationRecord
    belongs_to :user
    has_many :invoices, dependent: :destroy
end
