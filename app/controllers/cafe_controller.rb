class CafeController < ApplicationController
  # IMPORTANT!! REMOVE FOR PRODUCTION!
  skip_before_action :verify_authenticity_token, only: [:create]

  # @@menu = {
  #   latte: 4.00,
  #   scone: 5.00,
  #   tea: 3.00,
  # }

  def index
    @currency_symbol = "$"
    @menu = MenuItem.order(:name)
  end

  def about
    render json: MenuItem.all
  end

  def create
    # @@menu[params[:name].to_sym] = params[:price].to_f
    # render json: @@menu
    @item = MenuItem.create(name: params[:name], price: params[:price])
    redirect_t show_path()
  end

  def show
    # @item = { name: params[:item_name], price: @@menu[params[:item_name].to_sym] }
    @item = MenuItem.find_by_name(params[:item_name])
  end
end
