class LocationsController < ApplicationController

  before_filter :get_business
  # :get_business is defined at the bottom of the file,
  # and takes the business_id given by the routing and
  # converts it to an @business object

  def index
    @locations = @business.locations

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  def show
    @location = @business.locations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  def new
    @business = Business.find(params[:id])
    @location = @business.locations.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  def edit
    @location = @business.locations.find(params[:id])
  end

  def create
    @location = @business.locations.build(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to business_locations_url(@business), notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @location = @business.locations.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to business_locations_url(@business), notice: 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location = @business.locations.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to (business_locations_path(@business)) }
      format.json { head :ok }
    end
  end

  private
  # get_business converts the business_id given by the routing
  # into an @business object, for use here and in the view.
  def get_business
    @business = Business.find(params[:business_id])
  end
end
