
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Welcome To Articles"
  end

  #this is the index
  get '/articles'  do
  # we take all instances of articles an save them in articles
  # we use this variable inside our index file
  # go to index.erb
    @articles = Article.all 
    erb :index
  end
  # to create a new article
  get '/articles/new' do
  # create aticle object and save it into new article
  # use new article in new.erb
  # go to new.erb
    @article = Article.new
    erb :new
  end
# we are redicrected here from the new.erb to render the view
post '/articles' do 
  # create an article object with the "params" as attributes and saving to database
  # redirect after creating to the page for the article
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
# redirection after creation to view what was made
get '/articles/:id' do
  # search for an article object where the "params" is the same as id.
  # Then save to variable article for use in show.erb
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end
  

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

end