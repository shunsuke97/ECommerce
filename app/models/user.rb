# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_one :basket, dependent: :destroy
  has_one :purchase_record, dependent: :destroy

  def prepare_basket
    # create_basket == has_oneのリレーションを作ることによって定義されるメソッド
    # basketがないとき、後半が評価される
    basket || create_basket
  end

  def prepare_purchase_record
    purchase_record || create_purchase_record
  end

  def checkout!(token, product_ids:)
    # 買い物かごから商品を削除
    total = basket.total_price(product_ids: product_ids)

    transaction do
      basket_products = basket.basket_products.where(product_id: product_ids)
      basket_products.each(&:destroy!)

      purchase_record = prepare_purchase_record
      ids = product_ids.map { |id| { product_id: id } }
      purchase_record.purchase_record_products.create!(ids)
    end

    Charge.create!(total, token)
  end
end