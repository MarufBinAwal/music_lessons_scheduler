class Instructor < ApplicationRecord
    has_many :availabilities, dependent: :destroy
    has_many :lessons, through: :availabilities, dependent: :destroy
    has_many :students, through: :lessons
    
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
