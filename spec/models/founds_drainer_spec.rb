require 'rails_helper'

RSpec.describe FoundsDrainer, type: :model do
  fixtures :founds_drainers, :users, :groups

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(founds_drainers(:fd_one)).to be_valid
    end

    it 'is not valid without a name' do
      fd = founds_drainers(:fd_one)
      fd.name = nil
      expect(fd).not_to be_valid
    end

    it 'is not valid without an amount' do
      fd = founds_drainers(:fd_one)
      fd.amount = nil
      expect(fd).not_to be_valid
    end

    it 'is not valid with a negative amount' do
      fd = founds_drainers(:fd_one)
      fd.amount = -100
      expect(fd).not_to be_valid
    end

    it 'is not valid without an author_id' do
      fd = founds_drainers(:fd_one)
      fd.author_id = nil
      expect(fd).not_to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author (User)' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

    it 'has and belongs to many groups' do
      association = described_class.reflect_on_association(:groups)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
