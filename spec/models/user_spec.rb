require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(users(:one)).to be_valid
    end

    it 'is not valid without an email' do
      user = users(:one)
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user = users(:one)
      user.encrypted_password = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a name' do
      user = users(:one)
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with a duplicate email' do
      user = users(:one)
      user_with_duplicate_email = user.dup
      expect(user_with_duplicate_email).not_to be_valid
    end
  end

  describe 'Devise modules' do
    it 'includes Devise modules' do
      expect(described_class.devise_modules).to eq(
        %i[database_authenticatable rememberable recoverable registerable validatable]
      )
    end
  end
end
