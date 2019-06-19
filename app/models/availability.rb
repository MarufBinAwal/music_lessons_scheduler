class Availability < ApplicationRecord
    belongs_to :instructor
    has_many :lessons, dependent: :destroy
    has_many :students, through: :lessons


    def availability_details
        "#{self.day} #{self.start_time}-#{self.end_time} with #{self.instructor.full_name}"
    end

    def deactivate_lessons
        self.lessons.each do |lesson|
            lesson.update(active: false)
        end
    end

end
