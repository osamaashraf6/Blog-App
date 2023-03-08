require 'rails_helper'

RSpec.describe 'idex user', type: :feature do
  before :each do
    @user = User.create(
      name: 'Osama',
      photo: 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795',
      bio: 'Programmer',
      postsCounter: 0
    )
    @post1 = Post.create(author_id: @user.id, title: 'title osama', text: 'osama post one', commentsCounter: 0,
                         likesCounter: 0)
    @post2 = Post.create(author_id: @user.id, title: 'my title of osama', text: 'osama post two', commentsCounter: 0,
                         likesCounter: 0)
    @post3 = Post.create(author_id: @user.id, title: 'osama title', text: 'osama post three', commentsCounter: 0,
                         likesCounter: 0)
    visit user_path(@user.id)
  end

  it 'picture of user' do
    assert page.has_xpath?("//img[@src = 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795']")
  end

  it 'username' do
    expect(page).to have_content(@user.name)
  end

  it 'posts user' do
    expect(page).to have_content('0')
  end

  it 'user bio' do
    expect(page).to have_content('Programmer')
  end

  it 'first three posts of user' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  it 'button for all post' do
    expect(page).to have_link('See all posts')
  end

  it 'redirect to post show' do
    click_on 'title osama'
    expect(page).to have_current_path user_post_path(@user.id, @post1.id)
  end

  it 'redirect to all index ' do
    click_link('See all posts')
    expect(page).to have_current_path user_posts_path(@user.id)
  end
end
