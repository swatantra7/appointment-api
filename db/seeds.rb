# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

['doctor', 'patient'].each do |role|
  sa_role = Role.find_or_create_by(name: role)
end
role = Role.find_by(name: 'doctor')
doctor = User.new(:name=>"Doctor", :role_id=>role.id, :email=>"doctor@example.com", :password=>"password")
if doctor.save
  p "Created Doctor - #{doctor.name}"
else
  p "Cannot create user - #{doctor.errors.full_messages.join(', ')}"
end
doctor = User.new(:name=>"Doctor1", :role_id=>role.id, :email=>"doctor1@example.com", :password=>"password")
if doctor.save
  p "Created Doctor - #{doctor.name}"
else
  p "Cannot create user - #{doctor.errors.full_messages.join(', ')}"
end
role = Role.find_by(name: 'patient')
patient = User.new(:name=>'patient@example.com', :role_id=>role.id, :email=>'patient@example.com', :password=>"password")
if patient.save
  p "Created Patient - #{patient.name}"
else
  p "Cannot create Patient - #{patient.errors.full_messages.join(', ')}"
end
User.doctors.each do |user|
  slots_sets = YAML.load_file(File.open("#{Rails.root}/db/data/slots.yml"))
  slots_sets.each do |key, values|
    values.each do |val|
      schedule_from = val.split('-')[0]
      schedule_to = val.split('-')[1]
      now = DateTime.now
      schedule_from = DateTime.new(now.year, now.month, Date.today.day+key.to_i, schedule_from.to_i, 0, 0, now.zone)
      schedule_to = DateTime.new(now.year, now.month, Date.today.day+key.to_i, schedule_to.to_i, 0, 0, now.zone)
      user_slot = user.users_slots.new(
        schedule_from: schedule_from,
        schedule_to: schedule_to
      )
      user_slot.save
    end
  end
end
