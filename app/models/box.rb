class Box < ApplicationRecord
  acts_as_tenant :account
  has_many :items
end
