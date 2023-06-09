class TenantsController < ApplicationController
    
    def index
        render json: Tenant.all
    end

    def create
        tenant = Tenant.create!(params.permit(:name, :age))
        render json: tenant, status: :created
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update!(params.permit(:name, :age))
        render json: tenant, status: :updated
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

end
