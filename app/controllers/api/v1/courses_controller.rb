class Api::V1::CoursesController < ApplicationController
  def index
    render json: Course.all, status: 200
  end
end
