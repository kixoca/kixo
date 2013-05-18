class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :verify_if_participant!, :only => [:show, :edit, :update, :destroy, :reply]

  def index
    @conversations = current_user.conversations.page(params[:page])

    # pagination
    if @conversations.kind_of?(Array)
      Kaminari.paginate_array(@conversations).page(params[:page])
    else
      @conversations.page(params[:page])
    end

    respond_to do |format|
      format.html
      format.json { render :json => @conversations }
      format.xml  { render :xml  => @conversations }
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages.all

    @reply = @conversation.messages.build

    track_event "View Conversation"

    respond_to do |format|
      format.html
      format.json { render :json => @conversation }
      format.xml  { render :xml => @conversation }
    end
  end

  def new
    @conversation = Conversation.new(params[:conversation])
    @conversation.messages.build
  end

  def create
    params[:conversation][:participant_ids] = params[:conversation][:participant_ids].split(",").collect{|id| id.to_i}
    @conversation = Conversation.new(params[:conversation])

    @conversation.participants << current_user

    @conversation.messages.each do |message|
      message.author = current_user
    end

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation }
        format.json { render :json => @conversation, :status => :created, :location => @conversation }
        format.xml  { render :xml => @conversation, :status => :created, :location => @conversation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @conversation.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @conversation.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def verify_if_participant!
    conversation = Conversation.find(params[:id])
    unless conversation.participants.include?(current_user)
      flash[:error] = t("security.access_denied")
      redirect_to root_path
    end
  end

end
