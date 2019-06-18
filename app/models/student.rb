class Student < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :availabilities, through: :lessons
    has_many :instructors, through: :availabilities

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
