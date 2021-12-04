require 'stripe'
Stripe.api_key = ENV['STRIP_KEY']
class StripeHelloController < ApplicationController
  def index
    # アカウント作成
    # standard_user = Stripe::Account.create(
    #   type: "standard", 
    #   country: "JP",
    #   email: "standard@example.com"
    # )

    # 顧客追加
    # 支払い追加
    begin
      Stripe::Charge.create(
        amount: 2000,
        currency: "jpy",
        source: "tok_chargeDeclined", #Stripe.jsで自動で付与されるカード情報のトークン
        metadata: {"order_id": "6735"}
      )
    rescue => ex
      flash.now[:notice] = ex.message
    end
  end
end
