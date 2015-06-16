class LineItemsController < InheritedResources::Base
  # include CurrentCart
  # before_action :set_cart, only: [:create, :update, :destroy]
  
  def create
    @cart.add_product(line_item_params)

    respond_to do |format|
      if @cart.save
        format.json { render json: @cart }
        # render partial: 'carts/shopping_bag', locals: { order: @cart }
      else
        flash[:error] = 'There was a problem adding this item to your shopping bag.'
        redirect :back
      end

    end
  end

  private

    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :quantity)
    end
end

