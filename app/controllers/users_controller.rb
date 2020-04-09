class UsersController < ApplicationController

    get '/users/:username' do 
        if !logged_in?
            redirect to '/login'
        else 
            @user = User.find_by(:username => params[:username])
            @deals = Deal.all
            erb :'deals/deals'
        end 
    end 

    get '/signup' do 
        if !logged_in?
            erb :'/users/signup'
        else 
            redirect to "/users/#{current_user.username}"
        end 
    end 
    
    post '/signup' do 
        if params[:username] == "" || params[:password] == "" || params[:email] == ""
            redirect to '/signup'
        else 
            @user = User.new(params)
            @user.save
            session[:user_id] = @user.id
            redirect to "/users/#{@user.username}"
        end 
    end

    get '/login' do 
        if !logged_in?
            erb :'/users/login'
        else 
            redirect to "/users/#{current_user.username}"
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
            redirect to '/login'
        else 
            redirect to '/'
        end
    end 

end 