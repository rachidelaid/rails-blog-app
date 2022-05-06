require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations For the Comment model' do
    before(:each) do
      @user = User.new(id: 1, name: 'Rachid', photo: 'image_link', bio: 'full-stack Developer')
      @post = Post.new(author: @user, title: 'post 1', text: 'post content', comments_counter: 0, likes_counter: 0)
      @comment = Comment.new(text: 'comment1', author_id: @user.id, post_id: @post.id)
    end

    it "title shouldn't be empty" do
      @comment.text = nil
      expect(@comment).to_not be_valid
    end

    it "author_id shouldn't be a string" do
      @comment.author_id = 'string'
      expect(@comment).to_not be_valid
    end

    it "post_id shouldn't be a string" do
      @comment.post_id = 'string'
      expect(@comment).to_not be_valid
    end
  end
end
