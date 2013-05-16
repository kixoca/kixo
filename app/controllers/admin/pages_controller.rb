class Admin::PagesController < ApplicationController
  before_filter :authenticate_admin

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new(params[:page])
  end

  def edit
    @page = Page.find_by_name(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to edit_admin_page_path(@page) }
        format.json { render :json => @page, :status => :created, :location => @page }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end
end
