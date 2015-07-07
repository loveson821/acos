class Orders::BuildController < ApplicationController

  include Wicked::Wizard
  steps *Order.form_steps

  before_action :authenticate_user!

  def show
    @order = Order.find(params[:order_id])
    render_wizard
  end

  def update
    @order = Order.find(params[:order_id])
    # params[:order][:status] = 'active' if step == steps.last
    @order.update_attributes(order_params)
    render_wizard @order
  end

  private
    def order_params
      permitted_attributes = case step
                             when "personal"
                               [:name, :email, :address]
                             when "payment"
                               [:type]
                             when "preview"
                               []
                             end

      params.require(:order).permit(permitted_attributes)
    end
end
