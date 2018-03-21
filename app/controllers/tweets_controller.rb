class TweetsController < ApplicationController
  if !logged_in
    redirect "/login"
  else

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
      @tweet = Tweet.find(params[:id])
      if @tweet.user == current_user
        @tweet.destroy
        erb :'tweets/tweets'
      else
        redirect "/tweets/#{@tweet.id}"
      end
    end
  end #logged_in?

end
