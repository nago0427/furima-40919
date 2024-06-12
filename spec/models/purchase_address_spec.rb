require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id, token: 'tok_abcdefghijk00000000000000000')
      sleep(1)
    end
    
    context '内容に問題がない場合' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても保存できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
  
      it '郵便番号が正しい形式でなければ保存できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
  
      it '都道府県が空では保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
  
      it '市区町村が空では保存できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
  
      it '番地が空では保存できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
  
      it '電話番号が空では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
  
      it '電話番号が10桁未満では保存できない' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
  
      it '電話番号が11桁を超えると保存できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
  
      it '電話番号が全角数字だと保存できない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'ユーザーIDが空では保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it '商品IDが空では保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
