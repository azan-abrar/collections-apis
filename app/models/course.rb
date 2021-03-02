class Course < ApplicationRecord
  # Modules #
  include Indexes::CourseConcern

  # Associations #
  belongs_to :category

  # Validations #
  validates :name, :author, :state, presence: true

  # Enums #
  enum state: %i[active inactive]

  # Callbacks #
  after_commit :update_index

  # Methods #
  private

  def update_index
    __elasticsearch__.index_document
  end
end
