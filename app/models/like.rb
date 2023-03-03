class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_create :update_like_counter
  def update_like_counter
    post.increment(:likesCounter)
  end
end
