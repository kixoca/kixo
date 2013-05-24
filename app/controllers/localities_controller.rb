class LocalitiesController < ApplicationController

  def index
    if params[:region_id]
      @region = Region.find(params[:region_id])
      @country = @region.country
      @localities = @region.localities
    elsif params[:country_id]
      @country = Country.find(params[:country_id])
      @localities = @country.localities
    else
      @localities = Locality.all
    end

    respond_to do |format|
      format.html
      format.json { render :json => @localities }
      format.xml  { render :xml => @localities }
    end
  end

  def show
    @locality = Locality.find(params[:id])
    @region = @locality.region
    @country = @region.country

    @where = @locality.name

    @professionals = @locality.professionals

    @canonical_url = country_region_locality_url(@country, @region, @locality)

    respond_to do |format|
      format.html
      format.json { render :json => @locality }
      format.xml  { render :xml => @locality }
    end
  end

end
