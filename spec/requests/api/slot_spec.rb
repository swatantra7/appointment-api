RSpec.describe 'api/users/slots', type: :request do
  path '/api/users/slots' do
    get 'Slots' do
      tags 'Slots'
      consumes 'application/json'
      security [Bearer: {}]

      response '200', 'Slots' do
        let(:slot) { { doctor_id: 10, user_id: 10} }
        run_test!
      end
      response '422', 'invalid request' do
        let(:slot) { {doctor_id: nil} }

        run_test!
      end
    end
  end
end
