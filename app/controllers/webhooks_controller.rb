class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: [:create]

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header , ENV['WEB_TOKEN'])
    rescue JSON::ParserError => e
      puts "⚠️  Webhook error while parsing basic request. #{e.message})"
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      @user = User.find_by(stripe_customer_id: session.customer)
      @user.update(subscription_status: 'active')
    when 'customer.subscription.updated'
      subscription = event.data.object
      @user = User.find_by(stripe_customer_id: subscription.customer)
      @account = Account.find_by(user_id: @user.id)
      if subscription.items.data[0].price.unit_amount == 1000
        @plan = "moderate"
      elsif subscription.items.data[0].price.unit_amount == 10000
        @plan = "unlimitess"
      else
        @plan = "free"
      end
      @account.update(
        plan: @plan 
      )

    when 'customer.subscription.deleted'  
      byebug
    end

    render json: { message: 'success' }
  end
end
