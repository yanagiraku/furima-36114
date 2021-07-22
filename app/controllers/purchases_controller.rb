class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase = @item.purchase
  

  end

  def create
    @purchase = Purchase.create(purchase_params)
    Residence.create(residence_params)
    redirect_to root_path

  end

  private

  def purchase_params
    params.merge(user_id: current_user.id)
  end


  def residence_params
    params.permit(:postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number).merge(purchase_id: @purchase.id)
  end
end
