class Cocktail < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :doses, dependent: :destroy
    has_many :ingredients, through: :doses
    mount_uploader :image, ImageUploader, dependent: :destroy
    validates :remote_image_url, format: { with: /\A(http(s?):)([\/|.|\w|\s|-])*\.(?:jpg|gif|png|svg)\z/i, allow_blank: true }
end
