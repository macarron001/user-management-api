require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validating user creation' do
    it 'is not valid without email' do
      user = User.new
      user.email = nil

      expect(user).not_to be_valid
    end

    it 'is not valid without password' do
      user = User.new
      user.password = nil

      expect(user).not_to be_valid
    end

    it 'is not valid without name' do
      user = User.new
      user.name = nil

      expect(user).not_to be_valid
    end

    it 'is not valid without role' do
      user = User.new
      user.role = nil

      expect(user).not_to be_valid
    end

    it 'is not valid without phone number' do
      user = User.new
      user.phone_number = nil

      expect(user).not_to be_valid
    end
  end
end