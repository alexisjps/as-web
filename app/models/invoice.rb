class Invoice < ApplicationRecord
    belongs_to :user
    belongs_to :client
    # validates :discount, default: 0
end
