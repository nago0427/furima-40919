class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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

def edit
end

def update
  if @item.update(item_params)
  redirect_to item_path(@item)
  else
    render :edit, status: :unprocessable_entity
  end
end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

end