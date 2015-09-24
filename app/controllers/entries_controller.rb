class EntriesController < ApplicationController
	respond_to :json, :html

	def index
		render json: Entry.all
	end

	def show
		render json: Entry.find(params[:id])
	end

	def create
		render json: Entry.create(params[:entry])
	end

	def update
		render json: Entry.update(params[:id], params[:entry])
	end

	def destroy
		render json: Entry.destroy(params[:id])
	end
end
