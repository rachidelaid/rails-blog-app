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

  it 'I can see the user\'s bio.' do
    expect(page).to have_content('I\'m creating a test right now!')
  end

  it 'I can see the user\'s first 3 posts.' do
    expect(page).to have_content('Capybara Rules')
    expect(page).to have_content('RSpec is cool')
    expect(page).to have_content('Integration test')
  end

  it 'I can see a button that lets me view all of a user\'s posts.' do
    expect(page).to have_content('see all posts')
  end

  it 'When I click a user\'s post, it redirects me to that post\'s show page.' do
    click_link('Capybara Rules')
    expect(current_path).to eql(user_post_path(@user.id, @post.id))
  end

  it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    click_link('see all posts')
    expect(current_path).to eql(user_posts_path(@user.id))
  end
end
