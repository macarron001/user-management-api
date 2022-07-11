require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = User.create(email: 'hercules@user.com', password: 'password', name: 'Hercules', role: 'User', phone_number: '010-0030' )
  end

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

  context 'Validating CRUD actions' do

    it 'should allow a user to be created' do
      expect(@user).to be_valid
    end

    it 'should allow a user to be read' do
      expect(User.find_by(email: 'hercules@user.com')).to eq(@user)
    end

    it 'should allow a user to be updated' do
      @user.update(name: 'Herculez')
      expect(User.find_by(name: 'Herculez')).to eq(@user)
    end

    it 'should allow a user to be deleted' do
      @user.destroy
      expect(User.count).to eq(0)
    end
  end
end