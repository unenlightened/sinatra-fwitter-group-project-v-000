class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user'
  end

  get '/login' do
    erb :'users/login'
  end

  get '/logout' do

  end

  post '/signup' do
    redirect "/users/show"
  end

  post '/login' do
    redirect "/users/show"
  end

end
