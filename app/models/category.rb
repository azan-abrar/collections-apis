class Category < ApplicationRecord
  # Modules #
  include Indexes::CategoryConcern

  # Associations #
  belongs_to :vertical
  has_many   :courses, dependent: :destroy

  # Validations #
  validates :name, :state, presence: true
  validate :name_uniqueness

  # Scopes #
  scope :by_name, ->(name) { where('name iLike ?', name) }

  # Enums #
  enum state: %i[active inactive]

  # Nested Attributes #
  accepts_nested_attributes_for :courses, allow_destroy: true

  # Callbacks #
  after_commit :update_index

  # Methods #
  private

  def name_uniqueness
    errors.add(:base, 'Name already taken') if Category.by_name(name).any? || Vertical.by_name(name).any?
  end

  def update_index
    __elasticsearch__.index_document
  end
end
