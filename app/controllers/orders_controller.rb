class OrdersController < InheritedResources::Base

  before_action :authenticate_user!
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def new
    if @cart.line_items.empty?
      redirect_to root_path, :notice => "your cart is empty"
      return
    end

    @order = current_user.orders.new
    respond_to do |f|
      f.html
      f.xml { render :xml => @order }
    end
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:order_id])
    @order.update_attributes(order_params)
    render_wizard @order
  end

  def create
    @order = current_user.orders.create
    redirect_to order_build_path(@order, Order.form_steps.first)
  end

  def edit
    @order = current_user.orders.find(params[:id])
  end

  private

    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end

end

