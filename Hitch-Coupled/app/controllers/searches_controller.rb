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

    respond_to do |format|
      if @search.save
        format.json { render :json => @search.trips }
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
