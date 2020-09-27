class Admin < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :purchase_record_products, through: :products

  def sales
    sold_products = self.products.joins(:purchase_record_products)
    # 売れた商品一覧をもとに合計値を計算
    PriceCalculator.total(sold_products)
  end

  def sales_this_month
    sold_products = products
    .joins(:purchase_record_products)
    .where({ purchase_record_products: {created_at: Time.current.all_month} })
    PriceCalculator.total(sold_products)
  end
end