class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :client

    validates :quote_tva, presence: { message: "Le champ TVA doit être rempli" }
    validates :amount, presence: { message: "Le champ Montant doit être rempli" }
    validates :date, presence: { message: "Le champ Date doit être rempli" }
end
