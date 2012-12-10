class EagerBeaversController < ApplicationController

  before_filter :authenticate_admin_user!, :only => [:index, :update, :edit, :destroy]

  # GET /eager_beavers
  # GET /eager_beavers.json
  # GET /eager_beavers.xml
  def index
    @eager_beavers = EagerBeaver.all

    respond_to do |format|
      format.html { render :layout => "naked" }
      format.json { render :json => @eager_beavers }
      format.xml  { render :xml => @eager_beavers }
    end
  end

  # GET /eager_beavers/1
  # GET /eager_beavers/1.json
  # GET /eager_beavers/1.xml
  def show
    @eager_beaver = EagerBeaver.find(params[:id])

    respond_to do |format|
      format.html { render :layout => "naked" }
      format.json { render :json => @eager_beaver }
      format.xml  { render :xml => @eager_beaver }
    end
  end

  # GET /eager_beavers/new
  # GET /eager_beavers/new.json
  # GET /eager_beavers/new.xml
  def new
    @eager_beaver = EagerBeaver.new

    respond_to do |format|
      format.html { render :layout => "naked" }
      format.json { render :json => @eager_beaver }
      format.xml  { render :xml => @eager_beaver }
    end
  end

  # POST /eager_beavers
  # POST /eager_beavers.json
  # POST /eager_beavers.xml
  def create
    @eager_beaver = EagerBeaver.new(params[:eager_beaver])

    respond_to do |format|
      if @eager_beaver.save
        format.html { redirect_to @eager_beaver }
        format.json { render :json => @eager_beaver, :status => :created, :location => @beta }
        format.xml  { render :xml => @eager_beaver, :status => :created, :location => @beta }
      else
        format.html { render :action => "new" }
        format.json { render :json => @eager_beaver.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @eager_beaver.errors, :status => :unprocessable_entity }
      end
    end
  end

end
