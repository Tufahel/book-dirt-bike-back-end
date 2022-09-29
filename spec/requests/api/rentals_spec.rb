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
      post api_rentals_path,
           params: { rental: { book_date: '2020-02-02', return_date: '2020-03-02', city: 'Sylhet', motorcycle_id: '1',
                               user_id: '1' } }
      expect(response).to have_http_status(422)
    end
  end
end
