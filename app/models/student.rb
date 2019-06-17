class Student < ApplicationRecord
    has_many :lessonstudents, dependent: :destroy
    has_many :lessons, through: :lessonstudents, dependent: :destroy
    has_many :instructors, through: :lessons

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
