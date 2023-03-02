require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    user = User.create(name: 'osamamar', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                       bio: 'carpenter from america.')
    before(:each) do
      get '/users'
    end

    it 'When the GET request response status is right' do
      expect(response).to have_http_status(:ok)
    end

    it 'When renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'when response  involves right placeholder text' do
      expect(response.body).to include('All Users')
    end

    describe 'GET #show' do
      before(:each) do
        user = User.create(name: 'osamamar', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'carpenter from america.')
        get "/users/#{user.id}"
      end

      it 'When the GET request response status is right' do
        expect(response).to have_http_status(:ok)
      end

      it 'When renders the right template' do
        expect(response).to render_template(:show)
      end
      it 'When renders content rightly' do
        expect(response.body).to include('osamamar')
      end
    end
  end
end
