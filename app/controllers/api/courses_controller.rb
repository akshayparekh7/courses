# frozen_string_literal: true
class Api::CoursesController < ApplicationController

  def index
    @courses = Course.includes(:tutors).all
  end

  def create
    course = Course.new(course_params)
    if course.save
      render status: 200, json: { success: true }
    else
      render json: course.errors, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, tutors_attributes: %i[name email])
  end
end
