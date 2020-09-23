class BasketsController < ApplicationController
  # 未ログイン時にこのコントローラを使うとログインページにリダイレクトする
  before_action :authenticate_user!

  def show
    basket = current_user.prepare_basket
    @products = basket.products
    @total_price = basket.total_price
  end
end