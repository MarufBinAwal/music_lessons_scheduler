class Admin < ApplicationRecord
    has_secure_password

    validates :email, :presence => true, :uniqueness => { :case_sensitive => false }

    def full_name
        self.name
    end

    # validates :name, :presence => true
    # validates :password,  :presence => true, :length => { :within =>4..30 }

end
