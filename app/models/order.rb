class Order < ApplicationRecord
  # se crean cuatros atributos de instancia debido a que no se guarda estos datos en la bd
  attr_accessor :card_token

  belongs_to :customer
  has_one :payment
  after_create :create_payment

  # esto es por si se quiere agregar mas opciones de pago
  enum payment_method: %i[credit_card]

  # se crea un pago
  def create_payment
    params = {
      order_id: id,
      card_token: card_token
    }
    Payment.create!(params)
  end
end
