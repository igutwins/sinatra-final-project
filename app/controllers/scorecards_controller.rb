class ScorecardsController < ApplicationController
    
    get '/scorecard/:username/:name/new' do
        @user = current_user
        @deal = Deal.find_by(:name => params[:name])
        erb :'/scorecards/new'
    end
    
    post '/scorecard' do 
        @scorecard = Scorecard.create(params)
        @scorecard.deal_id = params[:deal_id]
        @scorecard.user_id = session[:user_id]
        @scorecard.save
        @user = current_user
        @deal = Deal.find_by_id(@scorecard.deal_id)
        redirect to "/scorecard/#{@user.username}/#{@deal.name}"
    end 

    get '/scorecard/:username/:name' do
        @deal = Deal.find_by(:name => params[:name])
        @user = current_user
        @scorecard = Scorecard.find_by(:user_id => @user.id, :deal_id => @deal.id)
        erb :'/scorecards/show_scorecard'
    end 

    get '/scorecard/:username/:name/edit' do
        @deal = Deal.find_by(:name => params[:name])
        @user = current_user
        @scorecard = Scorecard.find_by(:user_id => @user.id, :deal_id => @deal.id)
        erb :'/scorecards/edit'
    end

    patch '/scorecard/:username/:name' do
        if logged_in?
            @deal = Deal.find_by(:name => params[:name])
            @user = current_user
            @scorecard = Scorecard.find_by(:user_id => @user.id, :deal_id => @deal.id)
            if @scorecard.update(
                :franchise_rating => params[:franchise_rating],
                :market_rating => params[:market_rating],
                :competition_rating => params[:competition_rating],
                :customer_rating => params[:customer_rating],
                :supplier_rating => params[:supplier_rating],
                :growth_rating => params[:growth_rating],
                :cycle_rating => params[:cycle_rating],
                :management_rating => params[:management_rating],
                :go_rating => params[:go_rating]
                )
                redirect to "/scorecard/#{@user.username}/#{@deal.name}"
            else 
                redirect to "/scorecard/#{@user.username}/#{@deal.name}/edit"
            end 
        else
            redirect to '/login'
        end  
    end
end 