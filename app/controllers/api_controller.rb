class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Các hàm để trả về json cho ajax-call
  def loadListRestaurants
    @res = Restaurant.all
    render :json => {
        :list => @res
    }
  end
  # nhận form và tạo link chưa làm do chưa có database
  def generateLink
    #   params[:start,:end,:list of restaurants(:ids)]
    # Hiện chưa có database để code
    # @user = current_user
    # @order = Order.where(["user_id = ? and status=0" , @user.id])
    # if (@order == nil )
    #    # file order.rb co dong nay   has_secure_token :order_code
    #    @order = Order.create(:user_id => @user.user_id, :status => 0)
    #    @order.save
    #    code = @order.order_code # code de ung voi order
    #
    #    o = Object.create(:foo => 'bar')
    # end
    #
  end

  def loadMenuFromRestId
    # User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
    @restaurant = Restaurant.where(["id = ?",params[:id]]).first
    # @foods = Food.where(["restaurant_id = ?",@restaurant.id])
    @foods = @restaurant.foods
    render :json => {
        :foods => @foods
    }
  end
 # xxx đang làm dở
  def getOrderWithCode
    # params[:code]
    @order = Order.where(["order_code = ?", params[:code] ])
    render :json => {
        :restaurants => @order.restaurants
    }
  end
end