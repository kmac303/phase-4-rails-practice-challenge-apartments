class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all
    end

    def create
        apartment = Apartment.create!(params.permit(:number))
        apartment.leases.create(params.permit(:tenant_id))
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update!(params.permit(:number))
        render json: apartment
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end

end
