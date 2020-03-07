
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get 'articles/new' do
    erb :new
  end

  post '/articles' do
    binding.pry
    @article1 = Article.create(params)
    redirect ('/results')
  end

  get '/results' do
    erb :show
  end

end
