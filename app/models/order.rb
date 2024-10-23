class Order < ApplicationRecord
  # se crean cuatros atributos de instancia debido a que no se guarda estos datos en la bd
  attr_accessor :credit_card_number, :credit_card_exp_month, :credit_card_exp_year, :credit_card_cvv

  belongs_to :customer
  has_one :payment
  after_create :create_payment

  # esto es por si se quiere agregar mas opciones de pago
  enum payment_method: %i[credit_card]

  # se crea un pago
  def create_payment
    params = {
      order_id: id,
      credit_card_number: credit_card_number,
      credit_card_exp_month: credit_card_exp_month,
      credit_card_exp_year: credit_card_exp_year,
      credit_card_cvv: credit_card_cvv
    }
    Payment.create!(params)
  end
end
