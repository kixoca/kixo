class ProfessionalsController < ApplicationController

  # GET /professionals
  # GET /professionals.json
  def index
    @professionals = Professional.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render :json => @questions }
      format.xml  { render :xml => @questions }
    end
  end

  # GET /professionals/1
  # GET /professionals/1.json
  def show
    @professional = Professional.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @professional }
      format.xml  { render :xml => @professional }
    end
  end

  # GET /professionals/find
  # GET /professionals/find
  def find
    @topic

    @professionals = Professional.
  end

end
