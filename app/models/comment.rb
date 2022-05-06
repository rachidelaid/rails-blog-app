class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def comment_count(id)
    counts = Comment.where(post_id: id).count
    post = Post.find(id)
    post.update(comments_counter: counts)
  end
end
