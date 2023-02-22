class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.datetime :updatedAt
      t.datetime :createdAt
      t.integer :postsCounter

      t.timestamps
    end
  end
end
