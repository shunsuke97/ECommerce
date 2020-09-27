module PriceCalculator
  # 変換レートは固定にするため、定数にて定義
  USD_RATE = 110.freeze

  def self.total(products)
    jp_total = products.where(unit: 'yen').sum(:price)
    usd_total = products.where(unit: 'usd').sum(:price)

    jp_total + usd_total * USD_RATE
  end
end