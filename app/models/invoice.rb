class Invoice < ApplicationRecord
    belongs_to :user
    has_many :exports
end
