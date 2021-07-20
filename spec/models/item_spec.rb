require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context "商品出品登録ができる" do
      it "image、item_name、category_id、item_description、status_id、burden_id、delivery_id、day_delivery_id、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end

    end


    context "商品出品登録ができない" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "item_nameが空では登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      

      it "category_idが未選択では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end


      it "item_descriptionが未選択では登録できない" do
        @item.item_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end


      it "status_idが未選択では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "burden_idが未選択では登録できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end


      it "delivery_idが未選択では登録できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end


      it "day_delivery_idが未選択では登録できない" do
        @item.day_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day delivery must be other than 1")
      end

    

      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数値でなければ登録できない" do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300より安価であれば登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが9999999より高価であれば登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      
    end
  end
end
