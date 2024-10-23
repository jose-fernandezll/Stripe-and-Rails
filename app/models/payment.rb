class Payment < ApplicationRecord
  # atributos de instancia -pd: esto tambien de una forma intrinseca les da un get y set
  attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv

  belongs_to :order
  before_validation :create_on_stripe



  # crea el pago pero en stripe
  def create_on_stripe
    token = get_token
    params = { amount: order.amount_cents, currency: 'usd', source: token}
    response = Stripe::Charge.create(params)
    self.stripe_id = response.id
  end

  # Crea un token para la tarjeta de crédito utilizando la API de Stripe.
  # Esto es necesario para que Stripe procese el pago de manera segura
  def get_token
    Stripe::Token.create({
      card: {
        number: credit_card_number,
        exp_month: credit_card_exp_month,
        exp_year: credit_card_exp_year,
        cvc: credit_card_cvv,
      }
    })
  end
end
