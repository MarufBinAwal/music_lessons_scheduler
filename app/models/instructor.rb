class Instructor < ApplicationRecord
    has_many :availabilities, dependent: :destroy
    has_many :lessons, through: :availabilities, dependent: :destroy
    has_many :students, through: :lessons
    validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
    has_secure_password

    validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
    
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def deactivate_availabilities
        self.availabilities.each do |availability|
            availability.deactivate_lessons
            availability.update(active: false)
        end
    end

end
