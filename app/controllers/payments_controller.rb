class PaymentsController < ApplicationController
  require 'active_merchant/billing/rails'

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    # Extract plan and route info from params
    plan = params[:plan]
    from_state = params[:from_state]
    to_state = params[:to_state]

    month = params[:payment][:month]
    year = params[:payment][:year]

    credit_card = ActiveMerchant::Billing::CreditCard.new(
      first_name: params[:payment][:first_name],
      last_name: params[:payment][:last_name],
      number: params[:payment][:account_number],
      month: month.to_i,
      year: year.to_i,
      verification_value: params[:payment][:cvv]
    )

    if credit_card.valid?
      response = GATEWAY.purchase(1000, credit_card)  # Adjust amount as needed

      if response.success?
        @payment.save

        # Redirect with subscription info in params
        redirect_to thank_you_path(
  plan: 'monthly',
  from_state: 'Maharashtra',
  to_state: 'Tamil Nadu'
)

             else
        flash[:alert] = "Payment failed: #{response.message}"
        render :new
      end
    else
      flash[:alert] = "Invalid card details: #{credit_card.errors.full_messages.join(', ')}"
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:first_name, :last_name, :account_number, :cvv, :customer_id)
  end
end
