# frozen_string_ltieral: true
class Tutor < ApplicationRecord
  extend ValidationError

  belongs_to :course

  validates :email,
            uniqueness: {
              message: ->(object, data) { uniqueness_validation_message(object, data) }
            },
            presence: true
  validates :name, presence: true
end
