require 'rails_helper'

RSpec.describe Appointment, type: :model do

  let(:slot) { create :doctor_slot }

  let(:d_appointment) {build :doctor_appointment}
  describe '#check Shot' do
    it 'should be valid' do
      expect(slot).to be_valid
    end

  end

  describe 'associations' do
    it { should belong_to(:users_slot) }
    it { should belong_to(:patient) }
    it { should belong_to(:doctor) }
  end

  describe '#Check Appointment Object' do
    it 'should be valid' do
      expect(d_appointment).to be_valid
    end
  end


end
