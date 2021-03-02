class Vertical < ApplicationRecord
  # Modules #
  include Indexes::VerticalConcern

  # Associations #
  has_many :categories, dependent: :destroy

  # Validations #
  validates :name, presence: true
  validate :name_uniqueness

  # Scopes #
  scope :by_name, ->(name) { where('name iLike ?', name) }

  # Nested Attributes #
  accepts_nested_attributes_for :categories, allow_destroy: true

  # Callbacks #
  after_commit :update_index

  # Methods #
  private

  def name_uniqueness
    errors.add(:base, 'Name already taken') if Vertical.by_name(name).any? || Category.by_name(name).any?
  end

  def update_index
    __elasticsearch__.index_document
  end
end
