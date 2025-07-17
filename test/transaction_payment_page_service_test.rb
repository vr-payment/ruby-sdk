require "test/unit"
require 'vrpayment-ruby-sdk'

require_relative "constants.rb"

class TestTransactionPaymentPageService < Test::Unit::TestCase

  class << self
    def startup
      @@transaction_service = VRPayment::TransactionService.new
      
      @@transaction_payment_page_service = VRPayment::TransactionPaymentPageService.new
    end
  end

  description "payment_page_url() should create payment page URL"
  def test_payment_page_url
    transaction_create = @@transaction_service.create(SPACE_ID, get_transaction_create)

    url = @@transaction_payment_page_service.payment_page_url(SPACE_ID, transaction_create.id)

    assert_true(url.include?("securityToken"), "URL must have proper format")
  end

end
