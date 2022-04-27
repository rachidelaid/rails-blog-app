require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('a list of users')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before(:each) do
      get '/users/999'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('user page')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #posts' do
    before(:each) do
      get '/users/999/posts'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('list pf posts')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:posts)
    end
  end

  describe 'GET #post' do
    before(:each) do
      get '/users/999/posts/1'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('single post')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:post)
    end
  end
end
