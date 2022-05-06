require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'For the Post model' do
    before(:each) do
      @user = User.new(id: 1, name: 'Rachid', photo: 'image_link', bio: 'full-stack Developer')
      @post = Post.new(author: @user, title: 'post 1', text: 'post content', comments_counter: 0, likes_counter: 0)
    end

    it 'if all atributes pass validation' do
      expect(@post).to be_valid
    end

    it 'if there is title' do
      @post.title = nil
      expect(@post).not_to be_valid
    end

    it 'if there is max 250 characters' do
      @post.title = 'Testing lenght'
      expect(@post).to be_valid
    end

    it 'if likes counter is integer' do
      @post.likes_counter = 'string'
      expect(@post).not_to be_valid
    end

    it 'if likes counter greater than or equal to zero' do
      @post.likes_counter = -25
      expect(@post).not_to be_valid
    end

    it 'if comments counter greater than or equal to zero.' do
      @post.comments_counter = -2
      expect(@post).not_to be_valid
    end

    it 'if comments counter is integer' do
      @post.comments_counter = 0.25
      expect(@post).not_to be_valid
    end

    it 'if comments counter is integer' do
      @post.comments_counter = 15
      expect(@post).to be_valid
    end
  end
end