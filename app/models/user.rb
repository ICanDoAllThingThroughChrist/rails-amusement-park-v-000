class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
end
#http://guides.rubyonrails.org/active_record_migrations.html#changing-columns
