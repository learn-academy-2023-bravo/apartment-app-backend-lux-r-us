require 'rails_helper'

RSpec.describe "Apartments", type: :request do

  let(:user) { User.create(email: "testing@example.com", password:"password", password_confirmation:"password")}

  # INDEX=================================
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

  # CREATE=======================================================
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

    it "requires a street to create an apartment" do
      apartment_params = {
        apartment: {
          user_id: user.id,
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
      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end

    it "requires a city to create an apartment" do
      apartment_params = {
        apartment: {
          user_id: user.id,
          unit: '4 and a half',
          street: '32 Boulevard',
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
      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end

    it "requires a unit to create an apartment" do
      apartment_params = {
        apartment: {
          user_id: user.id,
          city: 'San Diego',
          street: '32 Boulevard',
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
      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end

    it "requires an image to create an apartment" do
      apartment_params = {
        apartment: {
          user_id: user.id,
          city: 'San Diego',
          street: '32 Boulevard',
          state: 'CA',
          square_footage: 500,
          price: '30,000,000',
          bedrooms: 0,
          bathrooms: 0.5,
          pets: 'NO',
          unit: '4 and a half',
        }
      }
      post '/apartments', params: apartment_params
      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end

  end

  # UPDATE============================================================================
  describe "PATCH/update" do
     it "updates an apartment" do
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
       
        apartment_params = {
          apartment: {
            street: 'New Street Name',
            city: 'New City Name',
            state: 'New State Name',
            price: '50,000,000',
            bedrooms: 1,
            bathrooms: 1,
            pets: 'YES'
          }
        }
        
        patch "/apartments/#{apartment.id}", params: apartment_params
        
        expect(response).to have_http_status(200)
        
        updated_apartment = Apartment.find(apartment.id)
        expect(updated_apartment.street).to eq 'New Street Name'
        expect(updated_apartment.city).to eq 'New City Name'
        expect(updated_apartment.state).to eq 'New State Name'
        expect(updated_apartment.price).to eq '50,000,000'
        expect(updated_apartment.bedrooms).to eq 1
        expect(updated_apartment.bathrooms).to eq 1
        expect(updated_apartment.pets).to eq 'YES'
    end
  end

  # DELETE===============================================
  describe "DELETE /destroy" do
    it "deletes an apartment" do
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
      delete "/apartments/#{apartment.id}"
      expect(response).to have_http_status(200)
      expect(Apartment.count).to eq(0) 
    end
  end
  
end