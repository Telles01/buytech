class UsersController < ApplicationController
  before_action :set_user
  before_action :set_product, only: [:destroy, :edit]

  def index
    #SHOW USERS AND THEIR PRODUCTS
  end

  def new
    @product = @user.products.build
    #OU
    @user = Product.new # PERGUNTAR ROBERTO
  end

  def create
    @product = @user.products.build(product_params)
    if @product.save
      redirect_to user_path(@user), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    redirect_to user_path(@user), notice: 'Product was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_product
    @product = @user.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description) #tenho que trocar isso
  end
end
