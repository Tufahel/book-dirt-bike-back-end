require 'swagger_helper'

RSpec.describe 'api/rentals', type: :request do
  path '/api/rentals' do
    get('list rentals') do
      response(200, 'successful') do
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

    post('create rental') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :rental, in: :body, schema: {
          type: :object,
          properties: {
            book_date: { type: :string },
            return_date: { type: :string },
            city: { type: :string },
            motorcycle_id: { type: :string, default: 1 },
            user_id: { type: :string, default: 1 }
          },
          required: %w[book_date return_date city user_id motorcycle_id]
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

  path '/api/rentals/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    delete('delete rental') do
      response(200, 'successful') do
        let(:id) { '1' }
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
