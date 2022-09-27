require 'rails_helper'

RSpec.describe 'Api::Motorcycles', type: :request do
  describe 'GET /api/motorcycles' do
    it 'motorcycle fetched successfully' do
      get api_motorcycles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/motorcycles' do
    it 'motorcycle posts successfully' do
      post api_motorcycles_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/motorcycles/:id' do
    it 'motorcycle fetched successfully' do
      get api_motorcycle_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
