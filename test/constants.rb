require 'vrpayment-ruby-sdk'

# singleton config of ApiClient
VRPayment.configure do |config|
    config.user_id = 512
    config.authentication_key = 'FKrO76r5VwJtBrqZawBspljbBNOxp5veKQQkOnZxucQ='
    config.default_headers = {"x-meta-header-ruby": 'value', "x-meta-header-ruby-2": 'value2'}
    config.timeout = 60
end


SPACE_ID = 405
TEST_CUSTOMER_ID = 7311742
TEST_CARD_PAYMENT_METHOD_CONFIGURATION_ID = 1352
FAKE_CARD_DATA = VRPayment::AuthenticatedCardDataCreate.new({
    primaryAccountNumber: '4111111111111111',
    expiryDate: '2026-12'
})


def get_transaction_create
    address = VRPayment::AddressCreate.new({
        city: "City",
        country: "US",
        emailAddress: "billing@address.com",
        familyName: "Family",
        givenName: "Given",
        postCode: "98100",
        postalState: "WA",
        street: "Sunshine st."
    })

    VRPayment::TransactionCreate.new({
        billingAddress: address,
        currency: "EUR",
        customerEmailAddress: "test@example.com",
        customerPresence: VRPayment::CustomersPresence::VIRTUAL_PRESENT,
        failedUrl: 'https://www.wallee.com/failure',
        invoiceMerchantReference: "order-1",
        language: "en_US",

        lineItems: [
            VRPayment::LineItemCreate.new({
            amountIncludingTax: 29.60,
            name: "Item 1",
            quantity: 1,
            shippingRequired: true,
            sku: "sku-1",
            taxes: [
                VRPayment::TaxCreate.new({
                rate: 8,
                title: "VAT"
                })
            ],
            type: VRPayment::LineItemType::PRODUCT,
            uniqueId: "unique-id-item-1",
            }),

            VRPayment::LineItemCreate.new({
            amountIncludingTax: 5.60,
            name: "Test Shipping",
            quantity: 1,
            shippingRequired: false,
            sku: "test-shipping",
            taxes: [
                VRPayment::TaxCreate.new({
                rate: 8,
                title: "VAT"
                })
            ],
            type: VRPayment::LineItemType::SHIPPING,
            uniqueId: "unique-id-shipping-1",
            }),
        ],

        merchantReference: "order-1",
        shippingAddress: address,
        shippingMethod: "Test Shipping"
    })
end


