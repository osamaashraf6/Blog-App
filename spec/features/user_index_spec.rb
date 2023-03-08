require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :each do
    @user1 = User.create(
      name: 'Osama',
      photo: 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795',
      bio: 'Full stack',
      postsCounter: 3
    )
    @user2 = User.create(
      name: 'Salem',
      photo: 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795',
      bio: 'programmer',
      postsCounter: 0
    )
    visit root_path
  end

  it 'username of all user' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'photo of user' do
    assert page.has_xpath?("//img[@src = 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795']")
    assert page.has_xpath?("//img[@src = 'https://www.shutterstock.com/image-vector/hi-hello-banner-speech-bubble-poster-1505210795']")
  end

  it 'number of posts' do
    expect(page).to have_content(' 3')
    expect(page).to have_content('0')
  end

  it 'show  on click' do
    click_link(@user1.name)
    expect(page).to have_current_path user_path(@user1.id)
  end
end
