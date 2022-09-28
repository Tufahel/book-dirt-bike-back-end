require 'swagger_helper'

RSpec.describe 'api/motorcycles', type: :request do
  path '/api/motorcycles' do
    get('list motorcycles') do
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

    post('create motorcycle') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :motorcycle, in: :body, schema: {
          type: :object,
          properties: {
            bike_name: { type: :string },
            details: { type: :string },
            amount: { type: :number },
            image: { type: :file },
            user_id: { type: :integer }
          },
          required: %w[bike_name details amount image user_id]
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

  path '/api/motorcycles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show motorcycle') do
      response(200, 'successful') do
        let(:id) { '1' }

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

    delete('delete motorcycle') do
      response(200, 'successful') do
        let(:id) { '12' }
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
