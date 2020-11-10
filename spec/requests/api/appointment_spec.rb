RSpec.describe 'api/appointment', type: :request do
  path '/api/users/appointments' do
    post 'Create Appointment' do
      tags 'Appointment'
      consumes 'application/json'
       security [Bearer: {}]
      parameter name: :appointment, in: :body, schema: {
        type: :object,
        properties: {
          doctor_id: { type: :integer },
          slot_id: { type: :integer },
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
  path '/api/users/appointments' do
    get 'All Appointments' do
      tags 'Appointments'
      consumes 'application/json'
       security [Bearer: {}]

      response '200', 'Appointment' do
        let(:appointment) { { slot_id: 10, doctor_id: 10} }
        run_test!
      end
      response '422', 'invalid request' do
        let(:appointment) { { slot_id: 10} }
        run_test!
      end
    end
  end
  path '/api/users/appointments/{doctor_id}/appointments' do
    get 'Appointments For Doctor' do
      tags 'Appointments'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :doctor_id, in: :path, type: :string

      response '200', 'Appointment found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            schedule_from: { type: :datetime },
            schedule_to: { type: :datetime }
          }
        run_test!
      end
      response '422', 'invalid request' do
        let(:appointment) { { slot_id: 10} }
        run_test!
      end
    end
  end
end
