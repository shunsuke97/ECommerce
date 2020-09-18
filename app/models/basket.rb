class Basket < ApplicationRecord
  has_many :basket_products, dependent: :destroy
  has_many :products, through: :basket_products

  # 変換レートは固定にするため、定数にて定義
  USD_RATE = 110.freeze

  # キーワード引数にデフォルト値を設定することで、引数を渡さなくてもエラーが起こらなくなる。
  def total_price(products_ids: nil)
    total_jpy_price(product_ids) + total_usd_price(product_ids)
  end

  private
  def total_jpy_price(product_ids)
    # if product_ids
    #   products = self.products.where(id: product_ids)
    # else 
    #   products = self.products
    # end
    products = product_ids ? self.products.where(id: product_ids) : self.products
    jp_products = products.where(unit: 'yen')
    # sumを使用してpriceの合計値を計算
    jp_products.sum(:price)
  end

  def total_usd_price(product_ids)
    products = product_ids ? self.products.where(id: product_ids) : self.products
    us_products = products.where(unit: 'usd')
    us_products.sum(:price) * USD_RATE
  end
end