require 'active_merchant'

ActiveMerchant::Billing::Base.mode = :test

# Sample gateway (using Bogus Gateway for testing)
GATEWAY = ActiveMerchant::Billing::BogusGateway.new
