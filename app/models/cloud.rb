class Cloud < ApplicationRecord
    has_many_attached :photos
    belongs_to :user, dependent: :destroy
end
