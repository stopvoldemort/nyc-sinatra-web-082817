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
    @figure = Figure.create(params[:figure])
    if params[:title][:name]
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect to '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if params[:title][:name]
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name]
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect to "/figures/#{@figure.id}"
  end

end
