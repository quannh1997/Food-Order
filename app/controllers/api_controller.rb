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
    # if (@order == nil )
    #    # file order.rb co dong nay   has_secure_token :
    #    @order = Order.create(:user_id => @user.user_id, :status => 0)
    #    @order.save
    #    code = @order.order_code # code de ung voi order
    #
    #    o = Object.create(:foo => 'bar')
    # end
    @user = current_user
    @order = Order.where(['user_id = ? and status = 0', @user.id])
    if (@order == [])
      @order = Order.new
      @order.status = 0
      @order.user_id = @user.id
      @order.code = Time.now.to_i
      @order.start = params[:start]
      @order.end = params[:end]
      @order.date = Time.now.utc
      @order.save
      # Lưu danh sách nhà hàng
      params[:ids].each do |restaurant_id|
        @orres = OrderRestaurant.new
        @orres.order_id = @order.id
        @orres.restaurant_id = restaurant_id
        @orres.save
      end
      render :json => {
          :message => 'ok',
          :order => @order,
      }
    else
      render :json => {
          :message => 'existed',
          :order => @order
      }
    end

  end

  def loadMenuFromRestId
    # User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
    @restaurant = Restaurant.where(["id = ?", params[:id]]).first
    # @foods = Food.where(["restaurant_id = ?",@restaurant.id])
    @foods = @restaurant.foods
    render :json => {
        :foods => @foods
    }
  end

  def showOrder
    # render :template => "menus/index", :locals => {:restaurant => @restaurant, :user => @user}
    @user = current_user
    if (@user == nil)
      redirect_to '/'
    end
    @order = Order.where(["status = ? and code= ?", 0, params[:code]]).first
    if (@order == nil)
      redirect_to '/'
    else
      render :template => "/orders/show", :locals => {:code => params[:code]}
    end
  end

  def getOrderWithCode
    # params[:code]
    @order = Order.where(["code = ?", params[:code]]).first
    render :json => {
        :order => @order,
        :restaurants => @order.restaurants
    }
  end

  def getFoodsWithCode
    # @posts = Post.where("category_id = ? AND product_model_id IN (?)", id, model_ids)
    @foods = Food.where("restaurant_id IN (?) and status = 1", params[:restaurantIds]);
    render :json => {
        :foods => @foods
    }
  end

  def storeFoodsOrder
    @order = Order.where(["code = ?", params[:code]]).first
    @user = current_user
    params[:ids].each do |food_id|
      @foodOrder = OrderFood.new
      @foodOrder.user_id = @user.id
      @foodOrder.food_id = food_id
      @foodOrder.order_id = @order.id
      @foodOrder.price = params[:money][params[:ids].index(food_id)]
      @foodOrder.count = params[:amount][params[:ids].index(food_id)]
      @foodOrder.save
    end
    render :json => {
        :message => 'ok'
    }
  end

  def getStatus
    @user = current_user
    @order = Order.where(["status = ? and user_id = ?", 0,@user.id]).first
    if (@order == nil)
      render :json => {
          :status => 'not_ordered',
          :order => nil
      }
    else
      render :json => {
          :status => 'ordered',
          :order => @order,
          :restaurants => @order.restaurants
      }
    end
  end

  def cancelOrder
    @user = current_user
    @order = Order.where(["status = ? and user_id = ? and code = ?",0,@user.id,params[:code]]).first
    if (@order!=nil)
      @order.status = 2
      @order.save
    end
    render :json => {
        :status => 'ok'
    }
  end
end