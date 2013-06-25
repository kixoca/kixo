class Admin::PagesController < ApplicationController
  before_filter :authenticate_admin

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new(params[:page])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html do
          flash[:success] = t("admin.page.create.success")
          redirect_to edit_admin_page_path(@page)
        end
        format.json { render :json => @page, :status => :created, :location => @page }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @page = Page.find_by_name(params[:id])
  end

  def update
    @page = Page.find_by_name(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html do
          flash[:success] = t("admin.page.update.success")
          redirect_to edit_admin_page_path(@page)
        end
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html do
          flash[:error] = t("admin.page.update.error")
          render action: "edit"
        end
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @page = Page.find_by_name(params[:id])

    respond_to do |format|
      format.html do
        if @page.destroy
          flash[:success] = t("admin.page.destroy.success")
          redirect_to admin_pages_path
        else
          flash[:error] = t("admin.page.destroy.error")
          redirect_to edit_admin_page_path(@page)
        end
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end
end
