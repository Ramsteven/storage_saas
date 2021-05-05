class WebhooksController < ApplicationController
  def create
  payload = request.body.read
  sig_header = request.env['HTTP_STRIPE_SIGNATURE']
  event = nil
  begin
    event = Stripe::Webhook.construct_event(
      payload, sig_header, "whsec_iXCiAmpkhdWcqYS0BGVxco4kLHUmmzJ5"
    )
    rescue JSON::ParserError => e
      # Invalid payload
      puts "⚠️  Webhook error while parsing basic request. #{e.message})"
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      puts 'Signature error'
      p e
      return
    end
    # Handle the event
    case event.type
    # when 'checkout.session.completed'
    #   session = event.data.object 
    #   @user = User.find_by(stripe_customer_id: session.customer)
    #   @account = Account.find_by(user_id: @user.id)
    #   @account.update(plan: '')
    #   # Then define and call a method to handle the successful payment intent.
    #   # handle_payment_intent_succeeded(payment_intent)
    when 'customer.suscription_updated, customer.subscription.delete'
      subscription = event.data.object # contains a Stripe::PaymentMethod
      @user = User.find_by(stripe_customer_id: subscription.customer)
      @account = Account.find_by(user_id: @user.id)
      @account.update(
        plan: subscription.items.data[0].price.lookup_key
      )
      # Then define and call a method to handle the successful attachment of a PaymentMethod.
      # handle_payment_method_attached(payment_method)
    else
      puts "Unhandled event type: #{event.type}"
    end
    status 200
  end
  
end
