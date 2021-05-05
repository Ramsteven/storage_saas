class CustomerPortalSessionsController < ApplicationController
  def create
    Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id
    })
  end
end
