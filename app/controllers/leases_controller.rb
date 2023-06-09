class LeasesController < ApplicationController
    
    def create
        lease = Lease.create!(params.permit(:rent))
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

end
