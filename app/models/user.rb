class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  enum role: [:normal, :moderator, :admin]
  def mood
    if self.happiness > self.nausea
      "happy"
    else
      "sad"
    end
  end
end
#http://guides.rubyonrails.org/active_record_migrations.html#changing-columns
