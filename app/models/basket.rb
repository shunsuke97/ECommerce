class Basket < ApplicationRecord
  has_many :basket_products, dependent: :destroy
  has_many :products, through: :basket_products

  # キーワード引数にデフォルト値を設定することで、引数を渡さなくてもエラーが起こらなくなる。
  def total_price(product_ids: nil)
    # product_idsが渡ってきたらその商品を取得し、なければbasketに入っている全ての商品を取得
    products = product_ids ? self.products.where(id: product_ids) : self.products
    PriceCalculator.total(products)
  end
end