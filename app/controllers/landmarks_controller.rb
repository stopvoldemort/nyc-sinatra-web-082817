class LandmarksController < ApplicationController
  set :views, 'app/views/landmarks'

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  post '/landmarks' do
    Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect to 'landmarks'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    erb :show
  end

  delete '/landmarks/:id' do
    Landmark.find(params[:id]).destroy
    redirect to '/landmarks'
  end

end
