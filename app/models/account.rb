class Account < ApplicationRecord
  acts_as_tenant(:user)
  belongs_to :user
end
