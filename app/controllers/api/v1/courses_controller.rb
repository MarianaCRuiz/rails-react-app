class Api::V1::CoursesController < ApplicationController
  def index
    render json: Course.all, status: 200
  end

  def create
    render json: Course.create!(permited_params), status: 201
  end

  def update
    course = Course.find(params[:id])
    course.update!(permited_params)
    render json: course, status: 200
  end

  private

  def permited_params
    params.require(:course).permit(:name, :registration_code, :description)
  end
end
