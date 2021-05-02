class Account < ApplicationRecord
  before_save { self.users << User.find(self.user_id) }
  #acts_as_tenant(:user)
  #belongs_to :user
  has_many :relations 
  has_many :users, through: :relations
  has_many :boxes
end
