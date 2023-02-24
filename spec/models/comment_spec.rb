require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'comment test' do
    before(:each) do
      @author = User.new(name: 'osama', photo: 'osamaportrait', bio: 'engineer of computer engineering')
      @post = Post.new(author: @author, title: 'Hi guys I am testing the post model', text: 'powered By osama')
      @comment = Comment.new(text: 'First comment', author: @author, post: @post)
    end

    it 'the comment text ought to be present' do
      @comment.text = 'osama'
      expect(@comment).to be_valid
    end

    it 'test the postId is integer' do
      @comment.post_id = '565'
      expect(@comment).to_not be_valid
    end

    it 'add a test for the post id to be valid' do
      comment = Comment.new(author: @author, post: @post)
      expect(comment).to be_valid
    end

    it 'here is the test of method update_comment_counter' do
      @comment.update_comment_counter
      expect(@post.commentsCounter).to be(1)
    end
  end
end
