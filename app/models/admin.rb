class Admin < ApplicationRecord
    has_secure_password

    # validates :name, :presence => true
    # validates :password,  :presence => true, :length => { :within =>4..30 }

end
