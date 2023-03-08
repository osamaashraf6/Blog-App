require 'rails_helper'

RSpec.describe 'the index of post', type: :feature do
  before :each do
    @user = User.create(
      name: 'Osama',
      photo: 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795',
      bio: 'Egyptian developer',
      postsCounter: 0
    )
    @post = Post.create(author_id: @user.id, title: 'title', text: 'My post of osama', commentsCounter: 0,
                        likesCounter: 0)
    Comment.create(post_id: @post.id, author_id: @user.id, text: 'curious comment')
    Comment.create(post_id: @post.id, author_id: @user.id, text: 'This osama comment')
    visit user_posts_path(@user.id)
  end

  it 'the picture of the user' do
    assert page.has_xpath?("//img[@src='https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795']")
  end

  it 'username of the user' do
    expect(page).to have_content(@user.name)
  end

  it 'number of post of user' do
    expect(page).to have_content('0')
  end

  it 'title of post' do
    expect(page).to have_content(@post.title)
  end

  it 'body of a post' do
    expect(page).to have_content('My post of osama')
  end

  it 'comments of a post' do
    expect(page).to have_content('curious comment')
  end

  it 'comments  post' do
    expect(page).to have_content('comments: 0')
  end

  it 'likes for a post' do
    expect(page).to have_content('likes: 0')
  end

  it 'redirect to posts show' do
    click_on 'title'
    expect(page).to have_current_path user_post_path(@user.id, @post.id)
  end
end
