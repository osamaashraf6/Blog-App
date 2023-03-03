class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_create :update_comment_counter

  def update_comment_counter
    post.increment(:commentsCounter)
  end
end
