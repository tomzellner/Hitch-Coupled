class SearchesController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  def show
    @trips = @search.trips
     
      
  end

  # GET /searches/new
  def new
    @search = Search.new
  end



  def create
    @search = Search.new(search_params)
    @trips = @search.trips
    @hash=[]
    @trips.each_with_index do |trip, index|
     @hash[index]={id: trip.id, driver_first: trip.driver.first_name, driver_last: trip.driver.last_name, 
                  start_city: trip.start_city, start_state: trip.start_state, 
                  end_city: trip.end_city, end_state: trip.end_state,  
                  passenger_count: trip.passengers.length, num_passengers: trip.num_passengers,
                  start_date: trip.start_date.to_time.strftime('%B %e 20%y'),
                  end_date: trip.end_date.to_time.strftime('%B %e 20%y')}
    end

    # p @trips.zip(@array)

    # p@trips

    p'@@@@@@@@@@@@@@@@@@@@@@'
    

    respond_to do |format|
      if @search.save
        format.json { render :json => @hash}
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
      else
        format.json { render json: @search.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.require(:search).permit(:start_city, :start_state, :end_city, :end_state)
    end
end
