require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
  before(:each) do
    @user = User.create(name: 'osama', photo: 'imagelink.jpg', bio: 'Egyptian developer')
    @post = Post.create(author: @user, title: 'title', text: 'text')
    (1..5).each do |i|
      @user.posts.create title: "Post number #{i}", text: "This is my #{i} post!"
      @post.update_post_counter
    end
    @comment = Comment.create(text: 'my one comment', author: @user, post_id: @post.id)
    @comment.update_comment_counter
    @comment = Comment.create(text: 'my two comment', author: @user, post_id: @post.id)
    @comment.update_comment_counter
    @like = Like.create(author: @user, post_id: @post.id)
    @like.update_like_counter
    visit user_post_path(user_id: @post.author_id, id: @post.id)
  end
  describe 'tests for view show' do
    it 'name user.' do
      expect(page).to have_content 'osama'
    end

    it 'wrote the post' do
      expect(page).to have_content 'osama'
    end

    it 'numbers comments ' do
      expect(page).to have_content 'comments: 2'
    end

    it 'numbers likes' do
      expect(page).to have_content 'likes: 1'
    end

    it 'post body' do
      expect(page).to have_content 'text'
    end

    it 'name  comment' do
      expect(page).to have_content 'osama'
    end

    it 'comment comment' do
      expect(page).to have_content 'my one comment'
      expect(page).to have_content 'my two comment'
    end
  end
end
