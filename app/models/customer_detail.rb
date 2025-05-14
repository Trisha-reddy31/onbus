class CustomerDetail < ApplicationRecord
  validates :name, :gender, :age, :contact, presence: true
end
