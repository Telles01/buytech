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

    def my_orders
      # @my_orders = current_user.orders
      @my_orders = Order.where(buyer_id: current_user)

    end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to my_orders_path, notice: "Order successfully canceled."
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
