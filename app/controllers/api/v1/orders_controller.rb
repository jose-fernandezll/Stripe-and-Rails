class Api::V1::OrdersController < ApplicationController
  def create
    @order = Order.new(order_params.merge(amount_cents: rand(1000..10000), payment_method: 'credit_card'))
    if @order.save
      render json: { order: @order, payment: @order.payment }, status: :created
    else
      render json: @response.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:data).permit(:customer_id, :card_token)
  end
end
