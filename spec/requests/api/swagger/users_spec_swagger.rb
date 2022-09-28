require 'swagger_helper'

RSpec.describe 'users', type: :request do
  path '/users/sign_in' do
    post('sign-in') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :users, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response(200, 'Successful') do
        let(:users) { { email: 'fredkruger@nomail.com', password: '123123' } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'One of the parameters is wrong') do
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

  path '/users' do
    post('sign-up') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :users, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          full_name: { type: :string },
          date_of_birth: { type: :date },
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }
      response(200, 'successful') do
        let(:users) { { username: 'John43', name: 'Toyosi', email: 'johntoyo@nomail.com', password: '123123' } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'One of the parameters is wrong') do
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
