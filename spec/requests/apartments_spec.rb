require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(email: "testing@example.com", password:"password", password_confirmation:"password")}
  describe "GET /index" do
    it "gets a list of all apartments" do
      apartment = user.apartments.create(
        street: '32 Boulevard',
        unit: '4 and a half',
        city: 'San Diego',
        state: 'CA',
        square_footage: 500,
        price: '30,000,000',
        bedrooms: 0,
        bathrooms: 0.5,
        pets: 'NO',
        image: 'https://www.moriliving.com/images/home/img_slide_003.jpg'
      )

      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.length).to eq 1
    end
  end

    describe "POST/create" do
      it "creates one apartment" do
        apartment_params = {
          apartment: {
            user_id: user.id,
            street: '32 Boulevard',
            unit: '4 and a half',
            city: 'San Diego',
            state: 'CA',
            square_footage: 500,
            price: '30,000,000',
            bedrooms: 0,
            bathrooms: 0.5,
            pets: 'NO',
            image: 'https://www.moriliving.com/images/home/img_slide_003.jpg'
          }
        }
        post '/apartments', params: apartment_params
        expect(response).to have_http_status(200)
        apartment = Apartment.first
        expect(apartment.street).to eq '32 Boulevard'
      end
    end
end