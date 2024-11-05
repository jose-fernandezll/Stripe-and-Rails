class Payment < ApplicationRecord
  # atributos de instancia -pd: esto tambien de una forma intrinseca les da un get y set
  attr_accessor :card_token

  belongs_to :order
  before_validation :create_on_stripe


  # crea el pago pero en stripe
  def create_on_stripe
    params = { amount: order.amount_cents, currency: 'usd', source: card_token}
    response = Stripe::Charge.create(params)
    self.stripe_id = response.id
  end

end
