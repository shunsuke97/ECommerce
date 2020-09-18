class ChargesController < ApplicationController
  def create
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    token = params[:stripeToken]
    product_ids = params[:product_ids].map(&:to_i)

    total = current_user.basket.total_price(product_ids: product_ids)

    # 買い物かごから商品を削除
    basket_products = current_user.basket.basket_products.where(product_id: product_ids)
    basket_products.each(&:destroy!)

    Charge.create!(total, token)
    redirect_to root_path, notice: '決済に成功しました'
  end
end