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
      expect(response).to have_http_status(422)
    end
  end
end
