require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'osama', photo: 'imagelink.jpg', bio: 'Egyptian developer')
    @post = Post.create(author: @user, title: 'title', text: 'text')
    @like = Like.create(author: @user, post_id: @post.id)
    @post.update_post_counter
    visit root_path
  end
  describe 'tests for index' do
    it 'name of user' do
      expect(page).to have_content 'osama'
    end

    it 'posts of user' do
      expect(page).to have_content ' 1'
    end
  end
end
