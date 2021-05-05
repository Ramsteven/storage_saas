class Payment < ApplicationRecord
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user

  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end

  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end

  def process_payment_moderate
    customer = Stripe::Customer.create email: email, card: token
    Stripe::Subscription.create customer: customer.id,
                                items: [
                               {price: 'price_1Ina4rBje2Voz840ckaY3wvk'},
                                ]
  end

 


  # def process_payment_moderate
  #   customer = Stripe::Customer.create email: email, card: token
  #   Stripe::Charge.create customer: customer.id,
  #                                   amount: 1000,
  #                                   description: 'Premium',
  #                                   currency: 'usd'
  # end

 def process_payment_unlimitess
    customer = Stripe::Customer.create email: email, card: token
    Stripe::Subscription.create customer: customer.id,
                                items: [
                               {price: 'price_1Ina4rBje2Voz840PTdbpD9A'},
                                ]

#    customer = Stripe::Customer.create email: email, card: token
#     Stripe::Charge.create customer: customer.id,
#                                     amount: 10000,
#                                     description: 'Premium',
#                                     currency: 'usd'
  end

 def process_payment_free
     customer = Stripe::Customer.create email: email, card: token
    Stripe::Subscription.create customer: customer.id,
                                items: [
                               {price: 'price_1Ina4rBje2Voz840jEauJF3v'},
                                ]


    # customer = Stripe::Customer.create email: email, card: token
    # Stripe::Charge.create customer: customer.id,
    #                                 amount: 50,
    #                                 description: 'Premium',
    #                                 currency: 'usd'
  end

end
