class Apartment < ApplicationRecord
  belongs_to :user
  validates :street, :city, :unit, :state, :square_footage, :price, :bedrooms, :bathrooms, :pets, :image, presence: true
end
