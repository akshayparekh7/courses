# frozen_string_literal: true
module ValidationError
  def uniqueness_validation_message(object, data)
    attribute_name = data[:attribute].downcase
    "#{data[:model]} with the #{attribute_name} #{object.send(attribute_name)} already exists..."
  end
end
