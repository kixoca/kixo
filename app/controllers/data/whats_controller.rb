class Data::WhatsController < ApplicationController

  def index
    if params[:term]
      @whats = Topic.search(params[:term]) + Profession.search(params[:term])
    else
      @whats = Topic.all + Profession.all
    end

    @humanized_whats = @whats.map {|what|
      label = "#{what.name} (#{what.category.name})"
      {
        :id    => what.id,
        :name  => what.name,
        :label => label,
        :rank  => what.rank
      }
    }

    respond_to do |format|
      format.json { render :json => @humanized_whats }
      format.xml  { render :xml  => @humanized_whats }
    end
  end

end
