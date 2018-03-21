class TweetsController < ApplicationController

  get '/tweets' do
    erb :'tweets/tweets'
  end

  get '/tweets/new' do
    erb :'tweets/create_tweet'
  end

  get '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    erb :'tweets/show_tweet'
  end

  get '/tweets/:id/edit' do
    @tweet = Tweet.find(params[:id])
    erb :'tweets/edit_tweet'
  end

  post '/tweets' do
    @tweet = Tweet.create(content: "blah")
    redirect "/tweets/#{@tweet.id}"
  end

  post '/tweets/:id' do
    @tweet = Tweet.find(params[:id])
    redirect "/tweets/#{@tweet.id}"
  end

  post '/tweets/:id/delete' do
    @tweet = Tweet.find(params[:id])
    erb :'tweets/tweets'
  end

end
