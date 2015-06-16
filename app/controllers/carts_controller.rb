class CartsController < InheritedResources::Base
  # include CurrentCart
  # before_action :set_cart, only: [:show]

  private

    def cart_params
      params.require(:cart).permit()
    end
end

