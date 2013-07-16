class Admin::TopicsController < ApplicationController
  before_filter :authenticate_admin

  def index
    @topics = Topic.order("id ASC")
  end

  def new
    @topic = Topic.new(params[:topic])
  end

  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html do
          flash[:success] = t("admin.topic.create.success")
          redirect_to edit_admin_profession_path(@topic)
        end
        format.json { render :json => @topic, :status => :created, :location => @topic }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.json { render :json => @topic.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html do
          flash[:success] = t("admin.topic.update.success")
          redirect_to edit_admin_profession_path(@topic)
        end
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html do
          flash[:error] = t("admin.topic.update.error")
          render action: "edit"
        end
        format.json { render :json => @topic.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html do
        if @topic.destroy
          flash[:success] = t("admin.topic.destroy.success")
          redirect_to admin_professions_path
        else
          flash[:error] = t("admin.topic.destroy.error")
          redirect_to edit_admin_profession_path(@topic)
        end
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end
end
