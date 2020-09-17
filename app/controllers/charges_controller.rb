class ChargesController < ApplicationController
  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    product_ids = params[:product_ids].map(&:to_i)

    products = current_user.basket.products.where(id: product_ids)
    total_jpy = products.where(unit: :yen).sum(:price)
    total_usd = products.where(unit: :usd).sum(:price)
    # Basket classにある定義されているUSD_RATEを使用
    total = total_jpy + total_usd * Basket::USD_RATE

    Stripe::Charge.create({
      amount: total,
      currency: 'jpy',
      description: 'Example charge',
      source: token
    })
    redirect_to root_path, notice: '決済に成功しました'
  end
end