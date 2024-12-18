class Course < ApplicationRecord
  validates :registration_code, :name, :description, presence: true
end
