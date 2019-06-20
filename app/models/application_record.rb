class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :email, :presence => true, :uniqueness => { :case_sensitive => false }
end
