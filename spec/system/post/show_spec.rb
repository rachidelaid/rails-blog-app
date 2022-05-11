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
    Comment.create(author_id: @user.id, post_id: @post.id, text:"another comment")
    @comment.comment_count(@post.id)

    @like = Like.create(author_id: @user.id, post_id: @post.id)
    @like.like_count(@post.id)

    visit user_post_path(@user.id, @post.id)
  end

  it 'I can see a post\'s title.' do
    expect(page).to have_content('Capybara Rules')
  end
  
  it 'I can see who wrote the post.' do
    expect(page).to have_content("by #{@user.name}")
  end
  
  it 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments: 2')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes: 1')
  end
  
  it 'I can see the post body.' do
    expect(page).to have_content('It\'s exciting!')
  end
  
  it 'I can see the username of each commentor.' do
    expect(page).to have_content("#{@user.name}: #{@comment.text}")
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content('Rachid: test comment')
    expect(page).to have_content('Rachid: another comment')
  end
end
