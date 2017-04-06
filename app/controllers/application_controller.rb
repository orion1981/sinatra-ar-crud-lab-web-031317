require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index

  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.find(params[:id]).delete
    erb :delete
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect '/posts/' + @post.id.to_s
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end






end
