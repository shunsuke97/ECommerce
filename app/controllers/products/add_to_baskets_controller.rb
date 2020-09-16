class Products::AddToBasketsController < Products::ApplicationController
  def create
    basket = current_user.prepare_basket
    product = Product.find(params[:product_id])
    # 商品を選択する際に、ユーザの入力ミスはありえない為、create!を使用する
    basket.basket_products.create!(product_id: product.id)

    redirect_to basket_path
  end
end