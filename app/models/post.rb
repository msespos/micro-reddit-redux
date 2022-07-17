class Post < ApplicationRecord
  validates :link, presence: true, length: { maximum: 140 }
  validates :caption, length: { maximum: 140 }
  belongs_to :user
  has_many :comments
  has_many :votes

  def self.posts_by_score
    Post.all.sort_by { |p| p.score }.reverse
  end

  def self.posts_by_hotness
    Post.all.sort_by { |p| p.hotness }
  end

  def score
    votes.where(upvote: true).count - votes.where(upvote: false).count
  end

  def hotness
    score <= 0 ? -1000 : created_at + 10 * Math.log(score)
  end

  def self.already_voted(user, post_id)
    user.votes.where(post_id: post_id).count > 0
  end
end
