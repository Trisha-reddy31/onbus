class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @subscriptions = [
      { plan: 'Monthly',  details: 'Access to  routes for a month' },
      { plan: 'Quarterly',  details: 'Access to  routes for three months' },
      { plan: 'Annually',  details: 'Access to  routes for a year with discounts' }
    ]
  end

  def show_plan
    @plan = params[:plan]
    @plan_data = case @plan
    when 'monthly'
      monthly_plans
    when 'quarterly'
      quarterly_plans
    when 'annually'
      annually_plans
    end
  end

  private

  def monthly_plans
    [
      { unique_id: 'MHKAR-M1', from_state: 'Maharashtra', to_state: 'Karnataka', price: 2500, trips: 20 },
      { unique_id: 'MHTN-M1', from_state: 'Maharashtra', to_state: 'Tamil Nadu', price: 3000, trips: 15 }
    ]
  end

  def quarterly_plans
    [
      { unique_id: 'MHKAR-Q1', from_state: 'Maharashtra', to_state: 'Karnataka', price: 7000, trips: 60 },
      { unique_id: 'MHTN-Q1', from_state: 'Maharashtra', to_state: 'Tamil Nadu', price: 8500, trips: 45 }
    ]
  end

  def annually_plans
    [
      { unique_id: 'MHKAR-A1', from_state: 'Maharashtra', to_state: 'Karnataka', price: 18000, trips: 200 },
      { unique_id: 'MHTN-A1', from_state: 'Maharashtra', to_state: 'Tamil Nadu', price: 22000, trips: 150 }
    ]
  end
end
