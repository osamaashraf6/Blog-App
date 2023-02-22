class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorId
      t.string :title
      t.text :text
      t.datetime :updatedAt
      t.datetime :createdAt
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end

