class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {minimum:8, maximum:10}
  has_many :posts
end
class Post < ActiveRecord::Base
  belongs_to :users
end
