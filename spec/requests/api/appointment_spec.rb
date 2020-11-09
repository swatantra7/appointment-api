RSpec.describe 'api/appointment', type: :request do
  path '/api/users/login' do
    post 'Create Appointment' do
      tags 'Appointment'
      consumes 'application/json'
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          doctor_id: { type: :integer },
          slot_id: { type: :string }
        },
        required: [ 'doctor_id', 'slot_id' ]
      }

      response '201', 'Appointment' do
        let(:appointment) { { slot_id: 10} }
        run_test!
      end
      response '422', 'invalid request' do
        let(:appointment) { { slot_id: 10} }
        run_test!
      end
    end
  end
end
