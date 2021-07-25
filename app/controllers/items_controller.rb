class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
    @purchase_residence = PurchaseResidence.new
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
  end

  def edit
    if @item.purchase.present?  
      redirect_to items_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private


  def item_params
    params.require(:item).permit(:image, :item_name, :category_id, :item_description, :status_id, :burden_id, :delivery_id, :day_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
