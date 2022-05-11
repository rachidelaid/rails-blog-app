require 'rails_helper'

RSpec.describe 'Users Show', type: :system do
  before do
    driven_by(:rack_test)
    @user = User.create(name: 'Rachid', photo: 'https://i.pravatar.cc/150?img=12',
                        bio: 'I\'m creating a test right now!',
                        email: 'test@domain.com')
    @user.confirm

    @post = Post.create(author_id: @user.id, title: 'Capybara Rules', text: 'It\'s exciting!')
    Post.create(author_id: @user.id, title: 'RSpec is cool', text: 'It\'s exciting!')
    Post.create(author_id: @user.id, title: 'Integration test', text: 'It\'s exciting!')

    @post.update_counter(@user.id)

    @comment = Comment.create(author_id: @user.id, post_id: @post.id, text:"test comment")
    @comment.comment_count(@post.id)

    @like = Like.create(author_id: @user.id, post_id: @post.id)
    @like.like_count(@post.id)

    visit user_path(@user.id)
  end

  it 'I can see the user\'s profile picture.' do
    expect(page).to have_css("img[src*='i.pravatar.cc/150?img=12']")
  end

  it 'I can see the user\'s username.' do
    expect(page).to have_content('Rachid')
  end

  it 'I can see the number of posts the user has written.' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'I can see a post\'s title.' do
    expect(page).to have_content('Capybara Rules')
  end

  it 'I can see some of the post\'s body.' do
    expect(page).to have_content('It\'s exciting!')
  end

  it 'I can see the first comments on a post.' do
    click_link('see all posts')
    expect(page).to have_content('test comment')
  end
  
  it 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes: 1')
  end
  
  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    click_link('see all posts')
    expect(page).to have_content('load more')
  end

  it 'When I click on a post, it redirects me to that post\'s show page.' do
    click_link('Capybara Rules')
    expect(current_path).to eql(user_post_path(@user.id, @post.id))
  end
end
