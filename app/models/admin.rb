class Admin < ApplicationRecord
    has_secure_password

    # validates :name, :presence => true
    # validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
    # validates :password,  :presence => true, :length => { :within =>4..30 }

end
