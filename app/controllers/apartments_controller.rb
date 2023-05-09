class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def create
    end

    def update
    end

    def destroy
    end

end
