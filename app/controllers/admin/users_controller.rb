class Admin::UsersController < ApplicationController
  before_filter :authenticate_admin

  def index
    @users = User.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password_confirmation].blank?

    if params[:user][:clear_topics]
      @user.destroy_classifications("Topic")
    end

    if params[:user][:clear_professions]
      @user.destroy_classifications("Profession")
    end

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

  def destroy
    @user = User.find(params[:id])

    respond_to do |format|
      format.html do
        if @user.destroy
          flash[:success] = t("admin.user.destroy.success")
          redirect_to admin_questions_path
        else
          flash[:error] = t("admin.user.destroy.error")
          redirect_to edit_admin_user_path(@user)
        end
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end
end
