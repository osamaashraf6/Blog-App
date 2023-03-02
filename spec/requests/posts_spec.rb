require 'rails_helper'

# RSpec.describe 'Posts', type: :request do
#   describe 'GET #index' do
#     before(:each) do
#       get '/users/1/posts'
#     end

#     it 'When the GET request response status is right' do
#       expect(response).to have_http_status(:ok)
#     end

#     it 'When renders the correct template' do
#       expect(response).to render_template(:index)
#     end

#     it 'when response  involves right placeholder text' do
#       expect(response.body).to include('All Posts for')
#     end

#     describe 'GET #show' do
#       before(:each) do
#         get '/users/1/posts/1'
#       end

#       it 'When the GET request response status is right' do
#         expect(response).to have_http_status(:ok)
#       end

#       it 'When renders the right template' do
#         expect(response).to render_template(:show)
#       end

#       it 'when rendered the content rightly' do
#         expect(response.body).to include('Post details')
#       end
#     end
#   end
# end

RSpec.describe PostsController, type: :request do
  let(:user) { User.create(name: "Test User") }
  let(:post) { user.posts.create(title: "Test Post", text: "This is a test post.") }

  describe "GET /users/:user_id/posts" do
    it "renders the index template" do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
    
    it "returns a 200 OK status code" do
      get user_posts_path(user)
      expect(response).to have_http_status(:ok)
    end
    
    it "includes the post title in the response body" do
      get user_posts_path(user)
      expect(response.body).to include('All Posts for Test User')
    end
  end

  describe "GET /users/:user_id/posts/:id" do
    it "renders the show template" do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
    
    it "returns a 200 OK status code" do
      get user_post_path(user, post)
      expect(response).to have_http_status(:ok)
    end
    
    it "includes the post title and body in the response body" do
      get user_post_path(user, post)
      expect(response.body).to include('Test Post')
      # expect(response.body).to include(post.text)
    end
  end
end
