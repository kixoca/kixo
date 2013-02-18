class MessagesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @messages = current_user.messages

    # pagination
    if @messages.kind_of?(Array)
      Kaminari.paginate_array(@messages).page(params[:page])
    else
      @messages.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.haml
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

end
