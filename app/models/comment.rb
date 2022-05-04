class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def comment_count
    post.increment!(:comment_counter)
  end
end
