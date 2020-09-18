class Charge
  # StripeのAPIKEYを設定する処理はStripeの機能を使うのに必ず必要なことなので、initializeで実行されるようにする
  def initialize
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def create!(price, token)
    Stripe::Charge.create({
      amount: price,
      currency: 'jpy',
      description: 'Example charge',
      source: token
    })
  end

  # いちいちnewをするのが面倒なのでclassメソッドを定義
  def self.create!(price, token)
    charge = self.new
    charge.create!(price, token)
  end
end