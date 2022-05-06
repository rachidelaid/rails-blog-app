class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def like_count(id)
    counts = Like.where(post_id: id).count
    post = Post.find(id)
    post.update(likes_counter: counts)
  end
end
