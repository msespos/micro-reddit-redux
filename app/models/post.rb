class Post < ApplicationRecord
  validates :link, presence: true, length: { maximum: 140 }
  validates :caption, length: { maximum: 140 }
  belongs_to :user
  has_many :comments
  has_many :votes

  def self.already_voted(user, post_id)
    user.votes.where(post_id: post_id).count > 0
  end
end
