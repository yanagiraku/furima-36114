require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_residence = FactoryBot.build(:purchase_residence, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe "商品購入機能" do
    context "商品購入ができる" do
      it "postal_code、delivery_id、municipality、adress、phone_number、tokenが存在すれば登録できる。" do
        expect(@purchase_residence).to be_valid
      end

      it "building_nameが空でも登録できる" do
        @purchase_residence.building_name = ""
        expect(@purchase_residence).to be_valid
      end

      
    end
    context "商品購入ができない" do

      it "user_idが空だと登録できない" do
        @purchase_residence.user_id = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと登録できない" do
        @purchase_residence.item_id = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Item can't be blank")
      end

      it "postal_codeが空では登録できない" do
        @purchase_residence.postal_code = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeは半角文字列でなければ登録できない" do
        @purchase_residence.postal_code = "１２３-４５６７"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeは3桁-4桁でなければ登録できない" do
        @purchase_residence.postal_code = "12-34567"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
      end

      it "delivery_idが未選択では登録できない" do
        @purchase_residence.delivery_id = 1
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Delivery must be other than 1")
      end

      it "municipalityが空では登録できない" do
        @purchase_residence.municipality = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressが空では登録できない" do
        @purchase_residence.address = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では登録できない" do
        @purchase_residence.phone_number = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは半角数値でなければ登録できない" do
        @purchase_residence.phone_number = "０１２３４５６７８９"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは10桁以上11桁以下でなければ登録できない（10桁未満では登録できない）" do
        @purchase_residence.phone_number = "123456789"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberは10桁以上11桁以下でなければ登録できない（12桁以上では登録できない）" do
        @purchase_residence.phone_number = "012345678901"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end


      it "tokenが空では登録できない" do
        @purchase_residence.token = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
