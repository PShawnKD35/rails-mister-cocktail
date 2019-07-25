class Ingredient < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :doses
    has_many :coctails, through: :doses
end
