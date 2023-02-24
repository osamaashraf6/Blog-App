class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  attribute :commentsCounter, :integer, default: 0
  attribute :likesCounter, :integer, default: 0

  def update_post_counter
    author.increment!(:postsCounter)
  end

  def recent_five_comments()
    comments.order(created_at: :desc).limit(5)
  end
end
