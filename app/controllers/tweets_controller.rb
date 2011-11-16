class TweetsController < ApplicationController
  before_filter:authenticate_user!, :only => [:create,:destroy]
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets }
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create

     tweet = current_user.tweets.build(params[:tweet])
     if tweet.save
       # flash[:notice] = "Tweet created!"
       redirect_to root_path
     else 
       flash[:alert]="error"
       redirect_to root_path
     end

     # @tweet = Tweet.new(params[:tweet])
     # 
     # respond_to do |format|
     #   if @tweet.save
     #     format.html { redirect_to(@tweet, :notice => 'Tweet was successfully created.') }
     #     format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
     #   else
     #     format.html { render :action => "new" }
     #     format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
     #   end
     # end
   end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    tweet = current_user.tweets.find(params[:id])
    tweet.destroy
    flash[:notice] = "Tweet destroyed!!"
    redirect_to root_path
  end

end
