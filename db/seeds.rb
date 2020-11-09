# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
role = Role.find_by(name: 'patient')
patient = User.new(:name=>'patient@example.com', :role_id=>role.id, :email=>'patient@example.com', :password=>"password")
if role.save
  p "Created Patient - #{patient.name}"
else
  p "Cannot create Patient - #{patient.errors.full_messages.join(', ')}"
end