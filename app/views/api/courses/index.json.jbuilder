json.courses @courses do |course|
  json.name course.name
  json.tutors course.tutors do |tutor|
    json.partial! 'api/tutors/show_template', tutor: tutor
  end
end
