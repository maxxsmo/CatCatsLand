class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @selection = JoinTableCartItem.where(cart_id: current_user.cart.id)
    @total = total
  end

  def create
    if current_user.cart.user_id != current_user.id
      Cart.create(user_id: current_user.id)
    end
    puts "#" * 30
    puts params
    @item = Item.find(params[:format])
    puts @item 
    puts "lol"
    @mix = JoinTableCartItem.new(cart_id: current_user.cart.id, item_id: @item.id)
    if @mix.save
      redirect_to items_path
    else
      render '/'
    end

    def destroy
    end

  end
  
  private

  def total
    total = 0
    @selection.each do |selection|
      total += selection.item.price
    end
    return total
  end
end