class TweetsController < ApplicationController

  get '/tweets' do
    erb :'tweets/tweets'
  end

  get '/tweets/new' do
    erb :'tweets/create_tweet'
  end

  get '/tweets/:id' do
    erb :'tweets/show_tweet'
  end

  get '/tweets/:id/edit' do
    erb :'tweets/edit'
  end

  post '/tweets' do
    redirect "/tweets/#{@tweet.id}"
  end

  post '/tweets/:id' do
    redirect "/tweets/#{@tweet.id}"
  end

  post '/tweets/:id/delete' do
    erb :'/tweets/tweets'
  end

end
