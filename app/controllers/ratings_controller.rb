class RatingsController < ApplicationController
	def new

	end

	def create
		
		@rating = Rating.new(rating_params)
		@rating.score.to_i

		respond_to do |format|
	        if @rating.save
	          format.json { render :json => @rating }
	          format.html {redirect :back}
	        else
	        	format.json { render :json => @rating.errors.full_messages, :status => :unprocessable_entity  }
	          	format.html {redirect :back}
	          end
	          

		

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
      params.require(:rating).permit(:rater_id, :rated_id, :score,)
    end
end
