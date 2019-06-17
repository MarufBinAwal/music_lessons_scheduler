# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |num|
    Faker::Config.locale = 'en-US'
    phone_number = "(#{Faker::PhoneNumber.area_code}) #{Faker::PhoneNumber.exchange_code}-#{Faker::PhoneNumber.subscriber_number}"

    first_name = Faker::Name.first_name
    Student.create(first_name: first_name, last_name: Faker::Name.last_name, date_of_birth: Faker::Date.birthday(12,60), phone_number: phone_number, email: "#{first_name}@gmail.com" )
end

10.times do |num|
    Faker::Config.locale = 'en-US'
    phone_number = "(#{Faker::PhoneNumber.area_code}) #{Faker::PhoneNumber.exchange_code}-#{Faker::PhoneNumber.subscriber_number}"
    instruments = ["Piano", "Guitar", "Drums", "Voice", "Saxophone", "Violin", "Flute"]

    first_name = Faker::Name.first_name
    Instructor.create(first_name: first_name, last_name: Faker::Name.last_name, date_of_birth: Faker::Date.birthday(22,60), phone_number: phone_number, email: "#{first_name}@gmail.com", instruments: instruments.sample, pay_rate: "$30/hour", active: true )
end
