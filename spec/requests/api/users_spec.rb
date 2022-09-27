require 'rails_helper'

RSpec.describe 'Api::Users' do
  describe 'GET /api/users' do
    it 'users fetched successfully' do
      get api_users_path
      expect(response).to have_http_status(200)
    end
  end
end
