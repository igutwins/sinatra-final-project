class User < ActiveRecord::Base
    has_secure_password
    has_many :scorecards
    has_many :deals, through: :scorecards
end 