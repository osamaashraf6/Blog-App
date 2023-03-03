# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
Post.create(author: first_user, title: 'Hedsallo1', text: 'This is my fidsadsarst post')
Post.create(author: first_user, title: 'Hello2', text: 'This is dsasamy first post')
Post.create(author: first_user, title: 'Hello3', text: 'This is my first dsadsapost')
Post.create(author: first_user, title: 'Hello4', text: 'This ddsasais my first post')
Post.create(author: first_user, title: 'Hello5', text: 'This is mdsdsaay first post')
Post.create(author: first_user, title: 'Hello6', text: 'This is my last post')
Post.create(author: first_user, title: 'Hello7', text: 'This is my test  post')
Comment.create(post: first_post, author: second_user, text: 'Hi 3!')
Comment.create(post: first_post, author: second_user, text: 'Hi T2!')
Comment.create(post: first_post, author: second_user, text: 'Hi 1!')
Comment.create(post: first_post, author: second_user, text: 'Hi ')
Comment.create(post: first_post, author: second_user, text: 'Hi 4!')
Comment.create(post: first_post, author: second_user, text: 'Hi 5!')
Comment.create(post: first_post, author: second_user, text: 'Hi 6!')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
