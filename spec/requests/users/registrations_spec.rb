require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/users' do
    post('create registration') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: { type: :object,
                    properties: {
                      username: { type: :string, required: true },
                      email: { type: :string, required: true },
                      password: { type: :string, required: true },
                      confirm_password: { type: :string, required: true },
                      date_of_birth: { type: :string, required: true }
                    } }
          }
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
