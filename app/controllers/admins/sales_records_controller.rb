class Admins::SalesRecordsController < Admins::ApplicationController
  def show
    @purchase_record_products = current_admin.purchase_record_products.preload(:product)
    if params[:start_at] && params[:end_at]
      # paramsから受け取った文字列を日付に変更
      start_at = Date.parse(params[:start_at])
      end_at = Date.parse(params[:end_at])
      @purchase_record_products = @purchase_record_products.where(created_at: start_at..end_at)
    end
  end
end