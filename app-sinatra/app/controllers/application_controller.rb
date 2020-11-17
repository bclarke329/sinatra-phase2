require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "skinzLogs*"
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    puts params
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    @user.save
    session[:user_id] = @user.id
    redirect '/users/home'
    # erb :signup
  end 

  get '/users/home' do 
  end
end
