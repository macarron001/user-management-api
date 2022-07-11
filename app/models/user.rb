class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :email, presence: true
  validates :name, presence: true
  validates :role, :inclusion => { :in => ['User', 'Admin', 'Superadmin']}
  validates :phone_number, presence: true


  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
