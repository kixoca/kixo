class RegionsController < ApplicationController

  def index
    if params[:country_id]
      @country = Country.find(params[:country_id])
      @regions = @country.regions
    else
      @regions = Region.all
    end

    @humanized_regions = @regions.map {|region|
      {:id => region.id,
       :name => region.name,
       :label => "#{region.name}, #{region.country.name}",
       :population => region.population}
    }

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @humanized_regions }
      format.xml  { render :xml => @humanized_regions }
    end
  end

  def show
    @country = Country.find(params[:country_id])
    @region = Region.find(params[:id])

    @professionals = @region.professionals

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @region }
      format.xml  { render :xml => @region }
    end
  end

end
