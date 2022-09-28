require 'swagger_helper'

RSpec.describe '/motorcycle', type: :request do
  path '/motorcycles' do
    get('listMotocycles') do
      tags 'Motorcycles'
      response(200, 'Successful') do
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

    post('add a motorcycle') do
      tags 'Motorcycles'
      security [bearerAuth: {}]
      consumes 'application/json'
      parameter name: :motorcycle, in: :body, schema: {
        type: :object,
        properties: {
          bike_name: { type: :string },
          details: { type: :string },
          image: { type: :string },
          amount: { type: :integer }
        },
        required: %w[bike_name details image amount]
      }
      response(201, 'Motorcycle got saved successfully') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:mentor) { { bike_name: 'Honda', details: 'Decent bike', image: 'https://www.something.com/photo.png', amount: 50 } }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, "Motorcycle couldn't be saved") do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:mentor) { { bike_name: 'Kawasaki', details: 'Some bike', image: 'photo', amount: 20 } }
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
