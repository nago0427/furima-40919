class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @categories = Category.all
    @conditions = Condition.all
    @shipping_fees = ShippingFee.all
    @prefectures = Prefecture.all
    @shipping_days = ShippingDay.all

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @categories = Category.all
      @conditions = Condition.all
      @shipping_fees = ShippingFee.all
      @prefectures = Prefecture.all
      @shipping_days = ShippingDay.all

      render :new, status: :unprocessable_entity
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

end