class PagesController < ApplicationController
  def home
    if user_signed_in?
      @tweets = Tweet.all
      @title = "Timeline"
      @tweet = Tweet.new
    else
      @tweets = Tweet.all
      @title = "Welcome Himap"
    end
    
   
  end

  def about
  end

  def help
  end
  


end
