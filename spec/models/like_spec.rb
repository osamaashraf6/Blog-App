require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'here I will add the test for the like of methods and validations' do
    before(:each) do
      @author = User.create(name: 'osama', photo: 'osamaportrait', bio: 'engineer of computer engineering')
      @post = Post.create(author: @author, title: 'Hi guys I am testing the post model', text: 'powered By osama')
      @like = Like.create(author: @author, post: @post)
    end

    it 'test the authorId is integer' do
      @like.author_id = 'osama'
      expect(@like).to_not be_valid
    end

    it 'is valid if it belongs to the author who created it' do
      like = Like.new(author: @author, post: @post)
      expect(like).to be_valid
    end

    it 'test the postId is integer' do
      @like.post_id = '625'
      expect(@like).to_not be_valid
    end
    it 'here is the test of method update_like_counter' do
      @like.update_like_counter
      expect(@post.likesCounter).to be(1)
    end
  end
end
