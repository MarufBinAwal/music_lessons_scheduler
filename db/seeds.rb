# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

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
    Instructor.create(first_name: first_name, last_name: Faker::Name.last_name, date_of_birth: Faker::Date.birthday(22,60), phone_number: phone_number, email: "#{first_name}@gmail.com", instruments: instruments.sample, pay_rate: "$30/hour", biography: Faker::Quote.matz, active: true )
end

Instructor.all.each do |instructor|
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
    end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
    temp_days = [days.sample,days.sample,days.sample,days.sample]
    temp_days.uniq.each do |day|
        start_times.count.times do |index|
            Availability.create(start_time: start_times[index], end_time: end_times[index], day: day, instructor: instructor, active: true)
        end
    end
end

30.times do |number|
    instruments = ["Piano", "Guitar", "Drums", "Voice", "Saxophone", "Violin", "Flute"]

    Lesson.create(availability: Instructor.all.sample.availabilities.sample, student: Student.all.sample, instrument: instruments.sample, price_of_lesson: 100, active: true, user: "God" )
end
