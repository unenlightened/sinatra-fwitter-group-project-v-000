class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      erb :'tweets/tweets'
    else
      redirect "/login"
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/create_tweet'
    else
      redirect "/login"
    end
  end

  get '/tweets/:id' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      erb :'tweets/show_tweet'
    else
      redirect "/login"
    end
  end

  get '/tweets/:id/edit' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      if @tweet.user == current_user
        erb :'tweets/edit_tweet'
      else
        redirect "/tweets/#{@tweet.id}"
      end
    else
      redirect "/login"
    end
  end

  post '/tweets' do
    redirect "/tweets/new" if params[:content].empty?

    @tweet = Tweet.create(content: params[:content], user_id: current_user.id)
    redirect "/tweets/#{@tweet.id}"
  end

  post '/tweets/:id' do
    redirect "/tweets/#{params[:id]}/edit" if params[:content].empty?

    @tweet = Tweet.find(params[:id])
    @tweet.update(content: params[:content])
    redirect "/tweets/#{@tweet.id}"
  end

  post '/tweets/:id/delete' do
    if logged_in?
      @tweet = Tweet.find(params[:id])
      if @tweet.user == current_user
        @tweet.destroy
        erb :'tweets/tweets'
      else
        redirect "/tweets/#{@tweet.id}"
      end
    else
      redirect "/login"
    end
  end

end
