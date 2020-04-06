class Deal < ActiveRecord::Base
    has_many :scorecards
    has_many :users, through: :scorecards
end 