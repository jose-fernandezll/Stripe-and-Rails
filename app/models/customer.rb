# encoding: UTF-8

class Customer < ApplicationRecord
  validates :stripe_id, presence: true

  has_many :orders
  before_validation :create_on_stripe, on: :create

  # cuando se crea el usuario se valida la presencia de stripe id
  # pero antes de eso se ejecuta create_on_stripe , lo que hace es crear un usuario en stripe
  # y el self hace referencia al modelo customer lo que hace es setearle la stripe_id

  def create_on_stripe
    response = Stripe::Customer.create({
      name: name,
      email: email
    })
    self.stripe_id = response.id

  end
end
