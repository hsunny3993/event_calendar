# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  name:                   'admin1',
  email:                  'admin1@shiftcare.com',
  password:               'solomon123',
  password_confirmation:  'solomon123'
)

address1 = Address.create(street: 'street1', city: 'city1', state: 'state1', postal_code: '123456', country: 'US')
address2 = Address.create(street: 'street2', city: 'city2', state: 'state2', postal_code: '123456', country: 'UK')

plumber1 = Plumber.create!(name: "plumber1", address_id: address1.id, vehicle: 'Car')
plumber2 = Plumber.create!(name: "plumber2", address_id: address2.id, vehicle: 'Bicycle')
plumber3 = Plumber.create!(name: "plumber3", address_id: address2.id, vehicle: 'Moto')

client1 = Client.create!(name: 'client1', age: 40, private_note: 'private_note1', address_id: address1.id)
client2 = Client.create!(name: 'client2', age: 50, private_note: 'private_note2', address_id: address2.id)

job1 = Job.create(client_id: client1.id, start_date: '2022-10-17', end_date: '2022-10-19')
relation1_of_job1 = JobRelation.create!(job_id: job1.id, plumber_id: plumber1.id)
relation2_of_job1 = JobRelation.create!(job_id: job1.id, plumber_id: plumber3.id)

job2 = Job.create(client_id: client2.id, start_date: '2022-10-17', end_date: '2022-10-19')
relation1_of_job2 = JobRelation.create!(job_id: job2.id, plumber_id: plumber1.id)
relation2_of_job2 = JobRelation.create!(job_id: job2.id, plumber_id: plumber2.id)