class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def like_count(post_id)
    counts = Like.where(post_id: post_id).count
    post = Post.find(post_id)
    post.update(likes_counter: counts)
  end
end