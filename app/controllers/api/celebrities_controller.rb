## celebritiess_controller.rb

module Api 
  class CelebritiesController < ApplicationController 
    def index 
      celebrities = Celebrity.all
      render json: {status: 'SUCCESS', message: 'Loaded celebrities', data: celebrities }, status: :ok
    end

    def show 
      celebrity = Celebrity.find(params[:id])
      render json: { status: "SUCCESS", message: 'See the information on your loaded celebrity below.', data: celebrity }, status: :ok
    end

    #Will create new Object in DB if POST request sent to api/celebrities
    def create 
      celebrity = Celebrity.new(celebrity_params)
      if celebrity.save 
        render json: { status: 'SUCCESS', message: 'You created a new celebrity in the database! See below..', data: celebrity }, status: :ok
      else
        render json: { status: 'ERROR', message: 'You were unable to save a new celebrity. Please try again..', data: celebrity.errors }, status: :unprocessable_entity
      end
    end
    # To Update an existing object in DB if PATCH/PUT request sent to api/celebrities/:id
    def update 
      celebrity = Celebrity.find(params[:id])
      if celebrity.update_attributes(celebrity_params) 
        render json: { status: "SUCCESS", message: 'You have sucessfully updated the celebrity record in the database', data: celebrity }, status: :ok
      else
        render json: { status: 'ERROR', message: 'You were unable to update the celebrity record. Please try again..', data: celebrity.errors }, status: :unprocessable_entity
      end
    end
    # To delete an existing object in DB if DELETE request sent to api/celebrities
    def destroy 
      celebrity = Celebrity.find(params[:id])
      celebrity.destroy 
      render json: { status: "SUCCESS", message: 'You have sucessfully deleted the celebrity record in the database', data: celebrity }, status: :ok
    end
  end
end