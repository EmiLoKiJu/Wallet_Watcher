class FoundsDrainer < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validate :at_least_one_category_selected

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author_id, presence: true

  private

  def at_least_one_category_selected
    if group_ids.blank? || group_ids.reject(&:blank?).empty?
      errors.add(:base, 'Please select at least one category')
    end
  end
end
