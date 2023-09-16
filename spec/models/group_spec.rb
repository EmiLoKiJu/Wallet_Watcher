require 'rails_helper'

RSpec.describe Group, type: :model do
  fixtures :groups, :users, :founds_drainers

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(groups(:group_one)).to be_valid
    end

    it 'is not valid without a name' do
      group = groups(:group_one)
      group.name = nil
      expect(group).not_to be_valid
    end

    it 'is not valid without an icon' do
      group = groups(:group_one)
      group.icon = nil
      expect(group).not_to be_valid
    end

    it 'is not valid without a user_id' do
      group = groups(:group_one)
      group.user_id = nil
      expect(group).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has and belongs to many founds_drainers' do
      association = described_class.reflect_on_association(:founds_drainers)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
