class Data::LocalitiesController < ApplicationController
  def index
    if params[:region_id]
      @region = Region.find(params[:region_id])
      @country = @region.country
      @localities = @region.localities
    elsif params[:country_id]
      @country = Country.find(params[:country_id])
      @localities = @country.localities
    else
      if params[:term]
        @localities = Locality.search(params[:term])
      else
        @localities = Locality.all
      end
    end

    @humanized_localities = @localities.sort_by(&:rank).reverse.map(&:name)

    respond_to do |format|
      format.json { render :json => @humanized_localities }
      format.xml  { render :xml => @humanized_localities }
    end
  end
end
