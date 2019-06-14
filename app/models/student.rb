class Student < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :instructors, through: :lessons
end
