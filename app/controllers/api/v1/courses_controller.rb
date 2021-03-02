class Api::V1::CoursesController < Api::BaseController
  def index
    run_interaction Courses::Index, each_serializer: CourseSerializer
  end

  def create
    run_interaction Courses::Create, serializer: CourseSerializer
  end

  def update
    run_interaction Courses::Update, serializer: CourseSerializer
  end

  def show 
    run_interaction Courses::Show, serializer: CourseSerializer
  end

  def destroy
    run_interaction Courses::Destroy
  end
end
