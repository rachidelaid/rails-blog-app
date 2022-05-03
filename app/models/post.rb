class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def update_counter(post_id)
    counts = Post.where(user_id: post_id).count
    user = User.find(post_id)
    user.update(posts_counter: counts)
  end

  def five_recent_comment(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).first(5)
  end
end
