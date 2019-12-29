class User < ActiveRecord ::Base
  validates :email, :password, presence: true
  validates :email, uniquess: true
  validates :password, length: {minimum:5, maximum:8}
end
