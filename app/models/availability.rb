class Availability < ApplicationRecord
    belongs_to :instructor
    has_many :lessons, dependent: :destroy
    has_many :students, through: :lessons


    def deactivate_lessons
        self.lessons.each do |lesson|
            lesson.update(active: false)
        end
    end

end
