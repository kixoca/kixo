class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html do
          flash[:success] = t("admin.user.update.success")
          redirect_to edit_admin_user_path(@user)
        end
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html do
          flash[:error] = t("admin.user.update.error")
          render action: "edit"
        end
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end
