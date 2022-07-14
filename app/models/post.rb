class Post < ApplicationRecord
  validates :link, presence: true, length: { maximum: 140 }
  validates :caption, length: { maximum: 140 }
  belongs_to :user
end
