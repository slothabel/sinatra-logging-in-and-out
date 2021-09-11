require 'pry'
require_relative '../../config/environment'
require_relative '../../app/helpers/helpers.rb'
class ApplicationController < Sinatra::Base
include Helpers
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    end
    erb :error
  end

  get '/account' do
    # binding.pry
    binding.pry
    @user = User.find_by(id: session[:user_id])
    if !@user.is_logged_in? 
      erb :error
    end
    erb :account
  end


  get '/logout' do

  end


end

