class Admin < ApplicationRecord
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
end