class Student < ApplicationRecord
    has_many :lessons, dependent: :destroy
    has_many :availabilities, through: :lessons
    has_many :instructors, through: :availabilities
    validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
    has_secure_password

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

end
