class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showMenu
    @restaurant = Restaurant.find(params[:restaurant_id])
    @userId = params[:id]
    @userName = params[:name]
    if (@userId != nil && @userName != nil)
      @user = User::where(["id = ? and name = ?", @userId, @userName]).first
    else
      @user = nil
    end
    # User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
    # { :name => "Shawn", :gender => "male" }.to_json
    render :template => "menus/index", :locals => {:restaurant => @restaurant, :user => @user}
  end

  def order
    # status 0 : đang đặt 1 thành công rồi
    @user = User::where(["email = ?", params[:email]]).first
    @order = Order::where(["user_id = ? and status = ?", @user[:id], 0]).first
    if (@order == nil)
      Order.create({:user_id => @user[:id], :restaurant_id => params[:restaurant_id], :status => 0, total_price: params[:total]})
    end
    @order = Order::where(["user_id = ? and status = ?", @user[:id], 0]).first
    @requestOrders = params[:order]
    @requestOrders.each do |orderr|
      OrderFood.create({:food_id => orderr[:id], :order_id => @order[:id]})
    end
    msg = {:status => "ok"}
    render :json => msg
    # render json: {:status => 'll'}
  end

  def theme
    render :template => "theme/index", :locals => {}
  end

  # Load ra danh sách dạng json trả về cho Vue xử lý
  def loadListRestaurants
    # @restaurants = Restaurant.all
    @res = Restaurant.find_by id: 1
    render :json => {
        :res => @res
    }

  end

  # nhận thông tin order - check thời gian , trạng thái ,. ...
  def generateLink
    #   params[:start,:end,:list of restaurants]
    #
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :average_star, :selected_count, :address)
  end
end
