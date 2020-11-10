require 'rails_helper'

describe User, type: :model do

  describe 'associations' do
    it { should have_many(:appointments).class_name('Appointment') }
    it { should have_many(:users_slots).class_name('Users::Slot') }
    it { should have_many(:tokens).class_name('Users::Token') }
    it { should belong_to(:role) }
  end

end