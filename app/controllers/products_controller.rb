class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show ]

  def index
    @products = Product.all
  end

  def my_products
    #@products= current_user.products
    @produts = Product.where(owner: current_user)
  end

  def edit

  end

  def update

    @product.update(product_params)
    redirect_to my_products_products_path
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
      redirect_to my_products_products_path, notice: 'Product was successfully created.'
    else
      render :new, notice: "Sorry. The product couldn't be created."
    end
  end

  def destroy
    @product.destroy
    redirect_to my_products_products_path, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :units, :price, :photo)
  end
end
