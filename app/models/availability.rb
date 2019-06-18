class Availability < ApplicationRecord
    belongs_to :instructor
    has_many :lessons, dependent: :destroy
    has_many :students, through: :lessons
end
