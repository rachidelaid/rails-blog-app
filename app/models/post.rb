class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # private

  def update_counter(id)
    puts id
    counts = Post.where(author_id: id).count
    user = User.find(id)
    puts user
    user.update(posts_counter: counts)
  end

  def five_recent_comment(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).first(5)
  end
end
