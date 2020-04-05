class DealsController < ApplicationController
    
    get '/deals' do
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

end 