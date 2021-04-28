class CafeController < ApplicationController
  # IMPORTANT!! REMOVE FOR PRODUCTION!
  skip_before_action :verify_authenticity_token
  before_action :set_item, only: [:show, :update, :destroy, :edit]

  def index
    @currency_symbol = "$"
    @menu = MenuItem.order(:name)
  end

  def new
    @item = MenuItem.new
  end

  def edit
  end

  def about
    render json: MenuItem.all
  end

  def create
    @item = MenuItem.create(item_params)
    redirect_to @item
  end

  def update
    @item.update(item_params)
    # @item.name = params[:name] if params[:name]
    # @item.price = params[:price] if params[:price]
    # @item.qty = params[:qty] if params[:qty]
    # @item.save
    redirect_to @item
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path 
  end

  def set_item
    @item = MenuItem.find(params[:id])
  end

  def item_params
    params.require(:menu_item).permit(:name, :price, :qty)
  end
end
