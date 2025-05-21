class ThankYouController < ApplicationController
  before_action :authenticate_user!

  def index
    @plan_param = params[:plan]
    @from_state = params[:from_state]
    @to_state = params[:to_state]

    plans_data = case @plan_param&.downcase
                 when 'monthly' then monthly_plans
                 when 'quarterly' then quarterly_plans
                 when 'annually' then annually_plans
                 else []
                 end

    # Find the selected subscription
    @subscription = plans_data.find do |sub|
      sub[:from_state] == @from_state && sub[:to_state] == @to_state
    end

    @start_date = Date.today
    @expiry_date = case @plan_param&.downcase
                   when 'monthly' then @start_date + 1.month
                   when 'quarterly' then @start_date + 3.months
                   when 'annually' then @start_date + 12.months
                   else @start_date
                   end

    @user = current_user
    @plan_id = @subscription[:unique_id] if @subscription.present?
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
