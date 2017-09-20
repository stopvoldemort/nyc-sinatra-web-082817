class FiguresController < ApplicationController
  set :views, 'app/views/figures'

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  get '/figures/new' do
    erb :new
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :edit
  end

  post '/figures' do
    binding.pry
    #receives post from /new
    redirect to '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

end
