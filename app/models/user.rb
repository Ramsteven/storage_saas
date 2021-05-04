class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :payment
  has_many :relations, dependent: :destroy
  has_many :accounts, through: :relations
  accepts_nested_attributes_for :payment
  accepts_nested_attributes_for :accounts
end
