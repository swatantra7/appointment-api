RSpec.describe 'api/users', type: :request do
  path '/api/users/login' do
    post 'User Login' do
      tags 'Login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'title', 'content' ]
      }

      response '201', 'User Login' do
        let(:user) { { name: 'patients' } }
        run_test!
      end
      response '422', 'invalid request' do
        let(:user) { { name: 'patient' } }
        run_test!
      end
    end
  end
end
