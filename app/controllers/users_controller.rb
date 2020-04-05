class UsersController < ApplicationController

    get '/signup' do 
        erb :'/users/signup'
    end 
    
    post '/signup' do 
        if params[:username] == "" || params[:password] == "" || params[:email] == ""
            redirect to '/signup'
        else 
            @user = User.new(params)
            @user.save
            session[:user_id] = @user.id
            redirect to '/users/deals'
        end 
    end

    get '/login' do 
        erb :'/users/login'
    end 
end 