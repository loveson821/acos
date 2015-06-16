class OrdersController < InheritedResources::Base

  include Wicked::Wizard
  steps :personal, :payment, :review

  def new
    if @cart.line_items.empty?
      redirect_to root_path, :notice => "your cart is empty"
      return
    end

    @order = Order.new
    respond_to do |f|
      f.html
      f.xml { render :xml => @order }
    end
  end

  def show
    @order = Order.find(params[:order_id])
    render_wizard
  end

  def update
    @order = Order.find(params[:order_id])
    @order.update_attributes(order_params)
    render_wizard @order
  end

  def create
    @order = Order.create
    redirect_to wizard_path(steps.first, :order_id => @order.id)
  end

  private

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end

end

