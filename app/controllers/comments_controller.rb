class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :create, :destroy]
  before_filter :verify_if_author!,  :only => [:edit, :update, :destroy]

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
        track_event "Create Comment"
        format.html do
          flash[:success] = I18n.t("comments.create.success")
          redirect_to @commentable
        end
        format.json { render :json => @comment, :status => :created, :location => @comment }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        track_event "Create Comment (Error)"
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
        track_event "Update Comment"
        format.html { redirect_to @commentable }
        format.json { head :no_content }
        format.xml  { head :no_content }
      else
        track_event "Update Comment (Error)"
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

    track_event "Destroy Comment"

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

  def verify_if_author!
    comment = Comment.find(params[:id])
    if comment.author != current_user
      flash[:error] = t("security.access_denied")
      redirect_to comment.commentable
    end
  end
end
