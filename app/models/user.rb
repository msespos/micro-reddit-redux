class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  has_many :posts
  has_many :comments
  has_many :votes
end
