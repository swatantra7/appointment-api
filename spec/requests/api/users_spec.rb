RSpec.describe 'api/users', type: :request do
  path '/login' do
    post 'User Login' do
      tags 'Login'
      consumes 'application/json'
      parameter email: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'title', 'content' ]
      }

      response '201', 'User Login' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end
end
