# app/models/subscription_plan.rb
class SubscriptionPlan < ApplicationRecord
    # You can add validations here, e.g.:
    validates :source, :destination, :plan_type, :price, presence: true
  end
  