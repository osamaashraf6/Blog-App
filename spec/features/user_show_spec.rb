require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'osama', photo: 'imagelink.jpg', bio: 'Egyptian developer')
    @post = Post.create(author: @user, title: 'title', text: 'text')
    (1..5).each do |i|
      @user.posts.create title: "Post number #{i}", text: "This is my #{i} post"
      @post.update_post_counter
    end
    @like = Like.create(author: @user, post_id: @post.id)
  
    visit user_path @user.id
  end
  describe 'tests show' do
    it 'users profile image.' do
      expect(page.find('img')['src']).to have_content @user.photo
    end

    it 'name of user' do
      expect(page).to have_content 'osama'
    end

    it 'test number of posts ' do
      expect(page).to have_content ' 5'
    end

    it 'users bio' do
      expect(page).to have_content 'Egyptian developer'
    end

    it 'users first 3 posts' do
      expect(page).to have_content 'Post number 5'
      expect(page).to have_content 'Post number 4'
      expect(page).to have_content 'Post number 3'
      expect(page).to have_no_content 'Post number 2'
    end

    it 'user post redirect post' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content 'comment'
      expect(page).to have_content 'like'
    end
  end
end