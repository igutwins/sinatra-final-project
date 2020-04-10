class DealsController < ApplicationController

    get '/deals/new' do
        if current_user.username == "igutwins"
            erb :'/deals/new'
        else 
            redirect to "/deals/#{current_user.username}"
        end 
    end

    post '/deals' do
        @deal = Deal.new(:name => params[:name])
        @deal.save
        redirect to "/deals/#{current_user.username}"
    end

    get '/deals/remove' do
        if current_user.username == "igutwins"
            @deals = Deal.all
            erb :'/deals/delete'
        else
            redirect to "/deals/#{current_user.username}"
        end 
    end 

    get '/deals/:username' do
        if current_user.username == params[:username]
            @user = User.find_by(:username => params[:username])
            @deals = Deal.all
            erb :'/deals/deals'
        else
            redirect to "/deals/#{current_user.username}"
        end 
    end

    delete '/deals/:id/delete' do
        @deal = Deal.find_by_id(params[:id])
        if @deal && current_user.username == "igutwins"
            @deal.delete
        end
        redirect to "/deals/#{current_user.username}"  
    end 

end 