class Post < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :department, presence: true
  validates :message, presence: true

 def self.most_recent
    order("created_at DESC")
  end

end
