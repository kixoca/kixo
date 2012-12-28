class CountriesController < ApplicationController

  def index
    @countries = Country.all

    @humanized_countries = @countries.map {|country|
      {:id => country.id,
       :name => country.name,
       :label => country.name,
       :population => country.population}
    }

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @humanized_countries }
      format.xml  { render :xml => @humanized_countries }
    end
  end

  def show
    @country = Country.find(params[:id])

    @professionals = @country.professionals

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @country }
      format.xml  { render :xml => @country }
    end
  end

end
