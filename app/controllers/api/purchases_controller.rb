class Api::PurchasesController < ApplicationController

  def create
    @purchase_option = PurchaseOption.find(params[:purchase_option_id])
    @purchase = current_user.purchases.new(purchase_option_id: @purchase_option.id)
    if @purchase.save
      render :purchase
    else
      render json: { errors: @purchase.errors }, status: :unprocessable_entity
    end
  end
end
