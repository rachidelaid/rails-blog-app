class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def three_recent_post(user_id)
    Post.order(updated_at: :desc).where(user_id: user_id).first(3)
  end
end
