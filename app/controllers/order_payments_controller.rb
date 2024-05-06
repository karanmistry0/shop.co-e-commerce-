class OrderPaymentsController < ApplicationController
  def create

    stripe_price = Stripe::Price.create({
                                          currency: 'usd',
                                          unit_amount: Money.from_amount(BigDecimal(order_payment_params[:total_amount])).cents,
                                          product_data: {
                                            name: "Clothes"
                                          },
                                        })

    success_url = url_for(controller: 'order_payments',action: 'success',only_path: false,order_params:order_payment_params)

    stripe_session = Stripe::Checkout::Session.create({
                                                        success_url:success_url,
                                                        line_items: [
                                                          {
                                                            price: stripe_price.id,
                                                            quantity: 1,
                                                          },
                                                        ],
                                                        mode: 'payment',
                                                      })

    redirect_to stripe_session.url, allow_other_host: true, status:303
  end

  def success
    order_params = params[:order_params]
    current_user = User.find(order_params[:user_id])

    # Create a new order for the current user
    order = current_user.orders.create!

    # Iterate through each cart item associated with the current user
    current_user.cart_items.each do |cart_item|
      # Associate the cart item with the order
      cart_item.update(order_id: order.id)
    end


    payment = Payment.create!(
      orders_id: order.id,
      sub_total: Money.from_amount(BigDecimal(order_params[:sub_total])),
      discount: Money.from_amount(BigDecimal(order_params[:discount])),
      total_amount: Money.from_amount(BigDecimal(order_params[:total_amount]))
      )

    current_user.cart_items.destroy_all

    redirect_to root_path
  end

  private
  def order_payment_params
    params.permit(
    :stripeToken,
    :user_id,
    :sub_total,
    :discount,
    :total_amount
    )
  end
end