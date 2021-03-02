class Verticals::Show < BaseInteraction
  def execute
    vertical.presence || errors.add(:base, 'Unable to find vertical')
  end

  private

  def vertical
    @vertical ||= Vertical.find_by(id: params[:id])
  end
end
