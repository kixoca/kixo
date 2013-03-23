class WheresController < ApplicationController

  def index
    if params[:term]
      @wheres = Locality.search(params[:term]) + Region.search(params[:term]) + Country.search(params[:term])
    else
      @wheres = Locality.all + Region.all + Country.all
    end

    @wheres = @wheres.sort_by(&:rank).reverse

    @humanized_wheres = @wheres.map {|where|
      name = label = case where.class.name
                when "Locality" then "#{where.name}, #{where.region.name}"
                when "Region" then "#{where.name}, #{where.country.name}"
                else where.name
              end
      {
        :id    => where.id,
        :name  => name,
        :label => label,
        :rank  => where.rank
      }
    }

    respond_to do |format|
      format.json { render :json => @humanized_wheres }
      format.xml  { render :xml  => @humanized_wheres }
    end
  end

end
