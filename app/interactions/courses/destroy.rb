class Courses::Destroy < BaseInteraction
  def execute
    course&.destroy || errors.add(:base, 'Unable to find course')
  end

  private

  def course
    @course ||= Course.find_by(id: params[:id])
  end
end
