require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validations For the Like model' do
    before(:each) do
      @user = User.new(id: 1, name: 'Rachid', photo: 'image_link', bio: 'full-stack Developer')
      @post = Post.new(author: @user, title: 'post 1', text: 'post content', comments_counter: 0, likes_counter: 0)
      @like = Like.new(author_id: @user.id, post_id: @post.id)
    end

    it 'if author_id is present' do
      @like.author_id = false
      expect(@like).not_to be_valid
    end

    it 'if post_id is present' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'like must be present' do
      @post.update(likes_counter: 1)
      expect(@post.likes_counter).to eq 1
    end
  end
end
