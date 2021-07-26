class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id
      redirect_to items_path
    else
      @purchase_residence = PurchaseResidence.new
    end
  end

  def create
    @purchase_residence = PurchaseResidence.new(purchase_residence_params)
    if @purchase_residence.valid?
      pay_item
      @purchase_residence.save
      redirect_to root_path
    else
      render :index
    end
  end

  private


  def purchase_residence_params
    params.require(:purchase_residence).permit(:postal_code, :delivery_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_residence_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end
  
end
