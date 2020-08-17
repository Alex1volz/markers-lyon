class Merchant < ApplicationRecord
  belongs_to :market
  has_many :upvotes
end
