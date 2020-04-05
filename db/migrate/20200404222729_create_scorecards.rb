class CreateScorecards < ActiveRecord::Migration[6.0]
  def change
    create_table :scorecards do |t|
      t.integer :franchise_rating
      t.integer :market_rating
      t.integer :competition_rating
      t.integer :customer_rating
      t.integer :supplier_rating
      t.integer :growth_rating
      t.integer :cycle_rating
      t.integer :management_rating
      t.integer :go_rating
      t.integer :deal_id
      t.integer :user_id
    end 
  end
end
