class CommentsController < ApplicationController
  # filters
  before_filter :authenticate!, :only => [:update, :edit, :create, :destroy]

  def show
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable

    respond_to do |format|
      format.html
      format.json { render :json => @comment }
      format.xml  { render :xml => @comment }
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.author = current_user
    @commentable = @comment.commentable

    respond_to do |format|
      if @comment.save
        format.html do
          flash[:success] = I18n.t("comments.create.success")
          redirect_to @commentable
        end
        format.json { render :json => @comment, :status => :created, :location => @comment }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => :new, :status => :unprocessable_entity }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @commentable }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        format.html { redirect_to @commentable }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    @comment.destroy

    respond_to do |format|
      format.html do
        flash[:success] = I18n.t("comments.destroy.success")
        redirect_to @commentable
      end
      format.json { head :no_content }
      format.xml  { head :no_content }
    end
  end

  private

  def authenticate!
    session[:user_return_to] = request.path
    authenticate_user!
  end
end
