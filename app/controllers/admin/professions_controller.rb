class Admin::ProfessionsController < ApplicationController
  before_filter :authenticate_admin

  def index
    @professions = Profession.order("id ASC")
  end

  def new
    @profession = Profession.new(params[:profession])
  end

  def create
    @profession = Profession.new(params[:profession])

    respond_to do |format|
      if @profession.save
        format.html do
          flash[:success] = t("admin.profession.create.success")
          redirect_to edit_admin_profession_path(@profession)
        end
        format.json { render :json => @profession, :status => :created, :location => @profession }
        format.xml  { render :xml => @profession, :status => :created, :location => @profession }
      else
        format.html { render :action => "new" }
        format.json { render :json => @profession.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @profession.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @profession = Profession.find(params[:id])
  end

  def update
    @profession = Profession.find(params[:id])

    respond_to do |format|
      if @profession.update_attributes(params[:profession])
        format.html do
          flash[:success] = t("admin.profession.update.success")
          redirect_to edit_admin_profession_path(@profession)
        end
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html do
          flash[:error] = t("admin.profession.update.error")
          render action: "edit"
        end
        format.json { render :json => @profession.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @profession.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @profession = Profession.find(params[:id])

    respond_to do |format|
      format.html do
        if @profession.destroy
          flash[:success] = t("admin.profession.destroy.success")
          redirect_to admin_professions_path
        else
          flash[:error] = t("admin.profession.destroy.error")
          redirect_to edit_admin_profession_path(@profession)
        end
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end
end
