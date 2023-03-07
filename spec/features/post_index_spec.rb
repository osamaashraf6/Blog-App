# (1..5).each do |i|
#   @user.posts.create title: "Post number #{i}", text: "This is my #{i} post!"
#   @post.update_post_counter
# end
# @comment = Comment.create(text: 'second comment', author: @user, post_id: @post.id)
# @comment.update_comment_counter
# @like = Like.create(author: @user, post_id: @post.id)
# @like.update_like_counter
# (1..5).each do |i|
#   @user.posts.create title: "Post number #{i}", text: "This is my #{i} post!"
#   @post.update_post_counter
# end
# @comment = Comment.create(text: 'second comment', author: @user, post_id: @post.id)
# @comment.update_comment_counter
# @like = Like.create(author: @user, post_id: @post.id)
# @like.update_like_counter


require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @user = User.create(name: 'osama', photo: 'imagelink.jpg', bio: 'Egyptian developer')
    @post = Post.create(author: @user, title: 'title', text: 'text')
    (1..5).each do |i|
      @user.posts.create title: "Post number #{i}", text: "This is my #{i} post!"
      @post.update_post_counter
    end
    @comment = Comment.create(text: 'second comment', author: @user, post_id: @post.id)
    @comment.update_comment_counter
    @like = Like.create(author: @user, post_id: @post.id)
    @like.update_like_counter
    visit user_posts_path @user.id
  end
  describe 'posts index' do
    it 'see the users profile picture.' do
      expect(page.find('.responsive')['src']).to have_content @user.photo
    end

    it 'name user.' do
      expect(page).to have_content 'osama'
    end

    it 'number posts' do
      expect(page).to have_content '5'
    end

    it 'posts title' do
      expect(page).to have_content 'title'
    end

    it 'posts body' do
      expect(page).to have_content 'text'
    end

    it 'comments  post' do
      expect(page).to have_content 'second comment'
    end

    it 'comments post' do
      expect(page).to have_content 'comments: 1'
    end

    it 'likes post' do
      expect(page).to have_content 'likes: 1'
    end

    it 'post redirects post page' do
      visit user_post_path(@user.id, @post.id)
      expect(page).to have_content 'comment'
      expect(page).to have_content 'like'
    end
  end
end