Rails.configuration.stripe = {

  :publisehable_key => "pk_test_51IWSA1Bje2Voz840TTOuypVonDVN5zmQ3g6nmnxiQuvyByZZGuwRbkFO6Gych10sDHx9N0E8mZYqnrk0OW1ht9hs008yOGzP1Y",
  :secret_key => "sk_test_51IWSA1Bje2Voz840rn4DxtXphoTlf43vbtCsqcmLmD53uA028cOb508P4lj660qvP6CGijvpHT0RL9CbSUVdBRgA00AAYyYg2P"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
