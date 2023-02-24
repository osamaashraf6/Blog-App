require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'the post test ' do
    before(:each) do
      @author = User.new(name: 'osama', photo: 'osamaportrait', bio: 'engineer of computer engineering')
      @post = Post.new(author: @author, title: 'Hi guys I am testing the post model', text: 'powered By osama')
    end

    it 'title ought to be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'add a test for Post where the title is valid.' do
      @post.title = 'osama'
      expect(@post).to be_valid
    end

    it 'is valid with a title that is 250 characters or less' do
      @post = Post.new(title: 'f' * 250, text: 'Lorem ipsum', author: @author)
      expect(@post).to be_valid
    end

    it 'the comments counter ought to be integer num' do
      @post.commentsCounter = 6.2
      expect(@post).not_to be_valid
    end

    it 'the comments counter ought to be integer num' do
      @post.commentsCounter = 'osama'
      expect(@post).to_not be_valid
    end

    it ' add a test for the comments counter where it is valid' do
      @post.commentsCounter = 5
      expect(@post).to be_valid
    end

    it 'the likes counter ought to be greater than zero' do
      @post.likesCounter = -6
      expect(@post).to_not be_valid
    end
    it ' add a test for the likes counter where it is valid' do
      @post.likesCounter = -6
      expect(@post).to_not be_valid
    end

    it 'here is the test of method recent_five_comments method' do
      expect(@post.recent_five_comments.length).to be(0)
    end

    it 'here is the test of method update_post_counter' do
      @post.update_post_counter
      expect(@author.postsCounter).to be(1)
    end
  end
end
