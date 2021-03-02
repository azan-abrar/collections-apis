class Courses::Update < BaseInteraction
  def execute
    return errors.add(:base, 'Unable to find category') if category.blank?
    return errors.add(:base, 'Unable to find course')   if course.blank?

    if course.update(course_params)
      course
    else
      errors.add(:base, course.errors.full_messages.to_sentence)
    end
  end

  private

  def category
    @category ||= Category.find_by(id: params[:category_id])
  end

  def course
    @course ||= category.courses.find_by(id: params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :state, :author)
  end
end
