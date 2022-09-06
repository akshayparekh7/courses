class Course < ApplicationRecord
  extend ValidationError

  has_many :tutors, dependent: :destroy
  accepts_nested_attributes_for :tutors

  validates :name, 
    uniqueness: { message: ->(object, data) { uniqueness_validation_message(object, data) }},
    presence: true
end
