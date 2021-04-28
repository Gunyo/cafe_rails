class CafeController < ApplicationController
  # IMPORTANT!! REMOVE FOR PRODUCTION!
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  def index
    @currency_symbol = "$"
    @menu = MenuItem.order(:name)
  end

  def about
    render json: MenuItem.all
  end

  def create
    @item = MenuItem.create(item_params)
    redirect_to show_item_path(@item.name)
  end

  def update
    @item = MenuItem.find_by_name(params[:item_name])
    @item.update(item_params)
    # @item.name = params[:name] if params[:name]
    # @item.price = params[:price] if params[:price]
    # @item.qty = params[:qty] if params[:qty]
    # @item.save 
    redirect_to show_item_path(@item.name)
  end

  def show
    @item = MenuItem.find_by_name(params[:item_name])
  end

  def destroy
    @item = MenuItem.find_by_name(params[:item_name])
    @item.destroy
    redirect_to root_path 
  end

  def item_params
    params.permit(:name, :price, :qty)
  end
end
