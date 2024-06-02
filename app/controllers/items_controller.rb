class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    # 必要に応じてインスタンス変数を設定
    # @items = Item.all
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

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_days_id, :image)
  end
  
end