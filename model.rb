class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum:8, maximum:10}
end
