class ScorecardsController < ApplicationController
    
    get '/scorecard/new/:deal_id' do
        erb :'/scorecards/new'
    end
    
    post '/scorecard' do 
        @scorecard = ScoreCard.new(params)
        @scorecard.deal_id = params[:deal_id]
        @scorecard.user_id = session[:user_id]
        @scorecard.save
        
    end 

end 