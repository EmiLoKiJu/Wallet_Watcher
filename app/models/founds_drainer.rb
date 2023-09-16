class FoundsDrainer < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :author_id, presence: true

  validate :at_least_one_group

  private

  def at_least_one_group
    if group_ids.empty?
      errors.add(:base, "You must select at least one category")
    end
  end
end
