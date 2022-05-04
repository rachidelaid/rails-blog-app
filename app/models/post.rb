class Post < ApplicationRecord
  has_many :comments, class_name: 'comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'post', foreign_key: 'author_id'
  has_many :likes, class_name: 'like', foreign_key: 'author_id'
  belongs_to :author, class_name: 'User'

  private

  def update_counter
    author.increment(:post_counter)
  end

  def five_recent_comment(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).first(5)
  end
end
