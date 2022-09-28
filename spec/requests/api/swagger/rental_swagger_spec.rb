require 'swagger_helper'

RSpec.describe '/rental', type: :request do
  path '/rental' do
    get('list rentals') do
      tags 'Rentals'
      security [bearerAuth: {}]
      response(200, 'Successful') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Not authorized') do
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

    post('create rrental') do
      tags 'Rental'
      security [bearerAuth: {}]
      consumes 'application/json'
      parameter name: :rental, in: :body, schema: {
        type: :object,
        properties: {
          motorcycle_id: { type: :integer },
          city: { type: :string }
          book_date: { type: :date },
          return_date: { type: :date }
        },
        required: %w[user_id motorcycle_id book_date return_date]
      }
      response(201, 'Rental got created successfully') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:rental) { { user_id: 1, motorcycle_id: 1, book_date: '2022-07-08', return_date: '2022-07-09' } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(401, 'Not authorized') do
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