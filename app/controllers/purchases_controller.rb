class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :check_user, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    @prefectures = Prefecture.all
  end

def new
  @purchase_address = PurchaseAddress.new
end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @prefectures = Prefecture.all
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def check_user
    if current_user.id == @item.user_id
      redirect_to root_path
      end
  end

end