class CustomerDetailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @subscription_plan = params[:plan]
    @subscription_price = params[:price]
    @customer = CustomerDetail.new
  end

  def create
    @customer = CustomerDetail.new(customer_details_params)
    @customer.user_id = current_user.id

    if @customer.save
      redirect_to new_payment_path(customer_id: @customer.id)
    else
      flash[:alert] = "Error saving your details. Try again."
      render :new
    end
  end

  private

  def customer_details_params
    params.require(:customer_detail).permit(:name, :gender, :age, :contact, :plan, :price)
  end
end
