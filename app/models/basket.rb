class Basket < ApplicationRecord
  has_many :basket_products, dependent: :destroy
  has_many :products, through: :basket_products

  # 変換レートは固定にするため、定数にて定義
  USD_RATE = 110.freeze

  def total_price
    total_jpy_price + total_usd_price
  end

  private
  def total_jpy_price
    jp_products = products.where(unit: 'yen')
    # sumを使用してpriceの合計値を計算
    jp_products.sum(:price)
  end

  def total_usd_price
    us_products = products.where(unit: 'usd')
    us_products.sum(:price) * USD_RATE
  end
end