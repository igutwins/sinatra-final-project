class ScorecardsController < ApplicationController
    
    get '/scorecard/new/:username/:name' do
        @user = current_user
        @deal = Deal.find_by(:name => params[:name])
        erb :'/scorecards/new'
    end
    
    post '/scorecard' do 
        @scorecard = Scorecard.create(params)
        @scorecard.deal_id = params[:deal_id]
        @scorecard.user_id = session[:user_id]
        @scorecard.save
        redirect to "/deals/#{current_user.username}"
    end 

    get '/scorecard/:username/:name/edit' do
        binding.pry
        @deal = Deal.find_by(:name => params[:name])
        @user = current_user
        @scorecard = Scorecard.find_by(:user_id => @user.id, :deal_id => @deal.id)
        erb :'/scorecards/edit'
    end

    patch '/scorecard/:username/:name' do
        @user = current_user
        @deal = Deal.find_by(:name => params[:name])
        erb :'/scorecards/new'
    end
    
end 