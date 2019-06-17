class Instructor < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :lessonstudents, through: :lessons, dependent: :destroy
    has_many :students, through: :lessonstudents
    has_many :availabilities

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
