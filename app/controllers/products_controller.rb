class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.owner = current_user
    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new, notice: "Sorry. The product couldn't be created."
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :units, :price)
  end
end
