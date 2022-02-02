class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def index
        spice = Spice.all
        render json: spice
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_spice
        spice.destroy
    end





    private

    def find_spice
        Spice.find(params[:id])
    end

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def not_found_response
        render json: {error: 'Spice not found'}, status: :not_found
    end
end
