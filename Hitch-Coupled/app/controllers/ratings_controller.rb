class RatingsController < ApplicationController
	def new

	end

	def create
		user = User.where(id: params[:user_id]).first
		rating = Rating.new(rating_params)
		
		if rating.save
			render json: {rating: rating}
		else
			status 400
		end

	end

	def show
		rating = Rating.where(id: params[:id]).first
		if rating
			render json: {rating: rating}
		else
			status 400
		end

	end



	def index
		ratings = Rating.all
		render json: {ratings: ratings}

	end



	def update
		rating = Rating.find(params[:id])
    if rating.update_attributes(rating_params)
      render json: {rating: rating}
    else
      render 'edit'
    end

	end



	def edit

	end



	def destroy
		Rating.find(params[:id]).destroy
	end

	private

	def rating_params
      params.permit(:rater_id, :rated_id, :score,)
    end
end
