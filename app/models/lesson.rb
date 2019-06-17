class Lesson < ApplicationRecord
    has_many :lessonstudents, dependent: :destroy
    has_many :students, through: :lessonstudents
    belongs_to :instructor
end
