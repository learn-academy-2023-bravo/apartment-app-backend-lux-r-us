require 'rails_helper'

RSpec.describe Apartment, type: :model do

  let(:user) { User.create(email: "testing@example.com", password:"password", password_confirmation:"password")}

  it "should have a valid street " do
    apartment = user.apartments.create(
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:street]).to include "can't be blank"
  end

  it "should have a valid city " do
    apartment = user.apartments.create(
      street: "ABC Street",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:city]).to include "can't be blank"
  end

  it "should have a valid unit " do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:unit]).to include "can't be blank"
  end

  it "should have a valid state " do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:state]).to include "can't be blank"
  end

  it "should have a valid square footage " do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:square_footage]).to include "can't be blank"
  end

  it "should have a valid price" do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:price]).to include "can't be blank"
  end

  it "should have a valid bedrooms" do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bathrooms: 2.5,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:bedrooms]).to include "can't be blank"
  end

  it "should have a valid bathrooms" do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      pets:"yes",
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:bathrooms]).to include "can't be blank"
  end

  it "should have a valid pets" do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      image: "https://cw33.com/wp-content/uploads/sites/8/2023/02/farm.jpg?w=1280&h=720&crop=1"
    )
    expect(apartment.errors[:pets]).to include "can't be blank"
  end

  it "should have a valid image" do
    apartment = user.apartments.create(
      street: "ABC Street",
      city: "Dallas",
      unit: "13C",
      state: "Texas",
      square_footage: 3000,
      price:"2000",
      bedrooms: 3,
      bathrooms: 2.5,
      pets:"yes",
    )
    expect(apartment.errors[:image]).to include "can't be blank"
  end

end
