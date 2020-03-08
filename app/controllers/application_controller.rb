
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles' do
    @articles = Article.all
    #binding.pry
    erb :index
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    #raise params.inspect
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @edited = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    binding.pry
    raise params.inspect
    @new_article = Article.find_by_id(params[:id])
    @new_article.update(params)

    redirect to "/articles/#{@article.id}"
  end
end
