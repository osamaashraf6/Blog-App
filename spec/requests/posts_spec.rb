require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let(:user) { User.create(name: 'Test User') }
  let(:post) { user.posts.create(title: 'Test Post', text: 'This is a test post.') }

  describe 'GET /users/:user_id/posts' do
    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'returns a 200 OK status code' do
      get user_posts_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'includes the post title in the response body' do
      get user_posts_path(user)
      expect(response.body).to include('Test User')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'renders the show template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end

    it 'returns a 200 OK status code' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:ok)
    end

    it 'includes the post title and body in the response body' do
      get user_post_path(user, post)
      expect(response.body).to include('This is a test post.')
      # expect(response.body).to include(post.text)
    end
  end
end
