require 'sinatra'
require 'pry'
require_relative 'config/application'


helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all.order(:name)
  erb :'meetups/index'
end

get '/meetups/:id' do
  @meetup = Meetup.find(params[:id])
  user = current_user
  erb :'meetups/show'
end

get '/new' do
  erb :'meetups/new'
end

post '/meetups' do
  user = current_user
  name = params[:name]
  location = params[:location]
  description = params[:description]

  if user == nil
    flash[:notice] = "Please sign in!"
    redirect '/new'
  else
    unless name.strip.empty? || location.strip.empty? || description.strip.empty?
      meetup = Meetup.create(name: name, location: location, description: description, creator_id: user.id)
      membership = Membership.create(user: user, meetup: meetup)
      redirect "/meetups/#{meetup.id}"
    else
      flash[:notice] = "Please fill out all forms!"
      redirect '/new'
    end
  end
end

post '/meetups/:id' do
  user = current_user
  meetup = Meetup.find(params[:id])
  if user == nil
    flash[:notice] = "Please sign in to join a meetup!"

  else
    Membership.create(user: user, meetup: meetup)
    flash[:notice] = "You have joined this meetup!"
  end
  redirect "/meetups/#{meetup.id}"
  
end
