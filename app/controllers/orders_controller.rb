class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def order_confirmation
    # @user = User.find(params[:id])
    @user = current_user
    # raise
    @product = Product.find(params[:product_id])
    # redirect_to order_confirmation_path(@product)
  end

  def create
    @order = Order.new
    @order.buyer = current_user # Assuming you have a current_user method available
    @product = Product.find(params[:product_id])
    @order.product = @product
    if @order.save
      redirect_to product_order_confirmation_path(@product), notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :payment)
  end
end
