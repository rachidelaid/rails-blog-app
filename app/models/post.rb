class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, presence: true,
                                               numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_counter(id)
    counts = Post.where(author_id: id).count
    user = User.find(id)
    user.update(posts_counter: counts)
  end

  def five_recent_comment(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).first(5)
  end
end
