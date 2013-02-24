class MessagesController < ApplicationController

  before_filter :authenticate_user!

  def show
    @message = Message.find(params[:id])
    @correspondent = @message.correspondent(current_user)

    @reply_message = Message.new(:parent_id => @message.id, :to_id => @correspondent.id)

    respond_to do |format|
      format.html # show.html.haml
      format.json { render :json => @message }
      format.xml  { render :xml => @message }
    end
  end

  def index
    #@messages = current_user.messages
    @messages = Message.all(:conditions => ["parent_id IS NULL AND (from_id = #{current_user.id} OR to_id = #{current_user.id})"])

    # pagination
    if @messages.kind_of?(Array)
      Kaminari.paginate_array(@messages).page(params[:page])
    else
      @messages.page(params[:page])
    end

    respond_to do |format|
      format.html # search.html.haml
      format.json { render :json => @messages }
      format.xml  { render :xml  => @messages }
    end
  end

  def sent
    @messages = current_user.messages_sent

    # pagination
    if @messages.kind_of?(Array)
      Kaminari.paginate_array(@messages).page(params[:page])
    else
      @messages.page(params[:page])
    end

    respond_to do |format|
      format.html # search.html.haml
      format.json { render :json => @messages }
      format.xml  { render :xml  => @messages }
    end
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render :json => @message }
      format.xml  { render :xml  => @message }
    end
  end

  def create
    @message = Message.new(params[:message])

    @message.from = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message }
        format.json { render :json => @message, :status => :created, :location => @message }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.json { render :json => @message.errors, :status => :unprocessable_entity }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

end
