class Box < ApplicationRecord
  acts_as_tenant :account
  belongs_to :account
end
