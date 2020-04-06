class DealsController < ApplicationController
    
    get '/deals' do
        @user = current_user
        @deals = Deal.all
        erb :'/deals/deals'
    end

    get '/deals/new' do
        erb :'/deals/new'
    end

    post '/deals' do
        @deal = Deal.new(:name => params[:name])
        @deal.save
        redirect to '/deals'
    end

    get '/deals/:username' do
        @user = User.find_by(:username => params[:username])
        @deals = Deal.all
        erb :'/deals/deals'
    end

end 