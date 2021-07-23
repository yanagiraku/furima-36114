class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_residence = PurchaseResidence.new
  
  end

  def create
    @purchase_residence = PurchaseResidence.new(purchase_params)
    if @purchase_residence.valid?
      @purchase_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_residence).permit(:postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
