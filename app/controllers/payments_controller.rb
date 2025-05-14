class PaymentsController < ApplicationController
  require 'active_merchant/billing/rails'

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
  
    # Ensure the customer_id is passed correctly (may need to set it dynamically)
    @payment.customer_id = params[:payment][:customer_id] if params[:payment][:customer_id]
  
    # Extract month and year directly from params for the credit card
    month = params[:payment][:month]
    year = params[:payment][:year]
  
    # Initialize the ActiveMerchant credit card object
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      first_name: params[:payment][:first_name],
      last_name: params[:payment][:last_name],
      number: params[:payment][:account_number],
      month: month.to_i,
      year: year.to_i,
      verification_value: params[:payment][:cvv]
    )
  
    # Validate the credit card
    if credit_card.valid?
      # Call your payment gateway (ActiveMerchant setup should have this)
      response = GATEWAY.purchase(1000, credit_card)  # Adjust the amount (1000 = $10.00)

      # Handle the response from the gateway
      if response.success?
        # Save the payment details (you may want to include more attributes like amount, status, etc.)
        @payment.save
        redirect_to thank_you_path, notice: "Payment successful!"
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
    # Permit only the fields that are part of the Payment model
    params.require(:payment).permit(:first_name, :last_name, :account_number, :cvv, :customer_id)
  end
end
