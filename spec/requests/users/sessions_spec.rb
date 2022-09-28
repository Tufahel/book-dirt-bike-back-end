require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do
  path '/users/sign_in' do
    post('create session') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            user: { type: :object,
                    properties: {
                      username: { type: :string, required: true },
                      password: { type: :string, required: true }
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
  path '/users/sign_out' do
    delete('destroy session') do
      response(200, 'successful') do
        consumes 'application/json'
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
