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

    @humanized_localities = @localities.map {|locality|
      {:id => locality.id,
       :name => locality.name,
       :label => "#{locality.name}, #{locality.region.name}, #{locality.region.country.name}",
       :population => locality.population}
    }

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @humanized_localities }
      format.xml  { render :xml => @humanized_localities }
    end
  end

  def show
    @locality = Locality.find(params[:id])
    @region = @locality.region
    @country = @region.country

    @professionals = @locality.professionals

    @canonical_url = country_region_locality_url(@country, @region, @locality)

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @locality }
      format.xml  { render :xml => @locality }
    end
  end

end
