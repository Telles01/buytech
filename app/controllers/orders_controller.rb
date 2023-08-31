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
    @order.buyer = current_user
    @product = Product.find(params[:product_id])
    @order.product = @product

    if @order.buyer == @product.owner
      redirect_to product_order_no_buy_path, alert: "You cannot buy your own product."
    else
      if @order.save
        @product.update(units: @product.units - 1) #aqui remove um produto
        redirect_to product_order_confirmation_path(@product), notice: 'Order was successfully created.'
      else
        render :new
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :payment)
  end
end
