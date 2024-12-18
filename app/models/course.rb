class Course < ApplicationRecord
  validates :registration_code, :name, :description, presence: true
  validates :registration_code, uniqueness: true
end
