class LocalitiesController < ApplicationController

  def show
    @locality = Locality.find(params[:id])
    @region = @locality.region
    @country = @region.country

    @professionals = @locality.professionals

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @locality }
      format.xml  { render :xml => @locality }
    end
  end

end
