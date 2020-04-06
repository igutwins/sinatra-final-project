class UsersController < ApplicationController

    get '/users/:username' do 
        @user = User.find_by(:username => params[:username])
        @deals = Deal.all
        erb :'deals/deals'
    end 

    get '/signup' do 
        erb :'/users/signup'
    end 
    
    post '/signup' do 
        if logged_in?
            redirect to "/users/#{current_user.username}"
        else 
            if params[:username] == "" || params[:password] == "" || params[:email] == ""
                redirect to '/signup'
            else 
                @user = User.new(params)
                @user.save
                session[:user_id] = @user.id
                redirect to "/users/#{@user.username}"
            end 
        end 
    end

    get '/login' do 
        if logged_in?
            redirect to "/users/#{current_user.username}"
        else 
            erb :'/users/login'
        end 
    end 

    post '/login' do 
        if params[:username] == "" || params[:password] == ""
            redirect to '/login'
        else
            @user = User.find_by(:username => params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id 
                redirect to "/users/#{@user.username}"
            else 
                redirect to '/login'
            end 
        end 
    end

    get '/logout' do 
        if logged_in?
            session.clear
            redirect to '/'
        else 
            redirect to '/'
        end
    end 


end 