require 'rails_helper'

RSpec.describe 'Api::Rentals', type: :request do
  describe 'GET /api/rentals' do
    it 'rentals fetched successfully' do
      get api_rentals_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/rentals' do
    it 'rentals posts successfully' do
      post api_rentals_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/rentals/:id' do
    it 'rentals fetched successfully' do
      get api_rental_path(1)
      expect(response).to have_http_status(200)
    end
  end
end
