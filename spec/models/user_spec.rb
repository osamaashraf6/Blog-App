require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'here I will add the test for the user of methods and validations' do
    subject { User.new(name: 'osama', photo: 'osamaportrait', bio: 'I am engineer of computer enginerring') }
    before { subject.save }
    it 'the name ought to be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it ' add a test for the name of the author, where it is valid.' do
      subject.name = 'abc'
      expect(subject).to be_valid
    end
    it 'the posts counter ought to be integer num' do
      subject.postsCounter = 'osama'
      expect(subject).to_not be_valid
    end
    it 'the posts counter ought to be greater than zero' do
      subject.postsCounter = -6
      expect(subject).to_not be_valid
    end
    it 'the posts counter ought to be integer num' do
      subject.postsCounter = 6.2
      expect(subject).to_not be_valid
    end
    it 'add a test for the post counter where it is valid' do
      subject.postsCounter = 6
      expect(subject).to be_valid
    end
    it 'The length of the array of recent_posts method' do
      method_length = subject.recent_posts.length
      expect(method_length).to be(0)
    end
  end
end
