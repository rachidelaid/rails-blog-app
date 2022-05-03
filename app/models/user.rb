class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def three_recent_post(user_id)
    Post.order(updated_at: :desc).where(user_id: user_id).first(3)
  end
end
