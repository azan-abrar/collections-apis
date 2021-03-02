class Courses::Create < BaseInteraction
  def execute
    return errors.add(:base, 'Unable to find category') if category.blank?

    course = category.courses.new(course_params)

    if course.save
      course
    else
      errors.add(:base, course.errors.full_messages.to_sentence)
    end
  end

  private

  def category
    @category ||= Category.find_by(id: params[:category_id])
  end

  def course_params
    params.require(:course).permit(:name, :state, :author)
  end
end
