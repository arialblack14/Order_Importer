class MyOrdersController < ApplicationController
  before_action :set_my_order, only: [:show, :edit, :update, :destroy]

  # GET /my_orders
  # GET /my_orders.json
  def index
    @my_orders = MyOrder.all
    respond_to do |format|
      format.html
      format.csv { send_data @my_orders.to_csv(['Name','Email','Financial Status','Paid at','Fulfillment Status','Fulfilled at','Accepts Marketing','Currency,Subtotal','Shipping','Taxes','Total','Discount Code',
      'Discount Amount','Shipping Method','Created at','Lineitem quantity','Lineitem name','Lineitem price','Lineitem compare at price','Lineitem sku','Lineitem requires shipping',
      'Lineitem taxable','Lineitem fulfillment status','Billing Name','Billing Street','Billing Address1','Billing Address2','Billing Company','Billing City','Billing Zip','Billing Province',
      'Billing Country','Billing Phone','Shipping Name','Shipping Street','Shipping Address1','Shipping Address2','Shipping Company','Shipping City','Shipping Zip','Shipping Province',
      'Shipping Country','Shipping Phone','Notes','Note Attributes','Cancelled at','Payment Method','Payment Reference','Refunded Amount','Vendor','Id','Tags',
      'Risk Level','Source','Lineitem discount','Tax 1 Name','Tax 1 Value','Tax 2 Name','Tax 2 Value','Tax 3 Name','Tax 3 Value','Tax 4 Name','Tax 4 Value','Tax 5 Name','Tax 5 Value','Phone']) }
    end
  end
  def import
    MyOrder.import(params[:file])
    redirect_to root_url, notice: "MyOrder imported."
  end

  # GET /my_orders/1
  # GET /my_orders/1.json
  def show
  end

  # GET /my_orders/new
  def new
    @my_order = MyOrder.new
  end

  # GET /my_orders/1/edit
  def edit
  end

  # POST /my_orders
  # POST /my_orders.json
  def create
    @my_order = MyOrder.new(my_order_params)

    respond_to do |format|
      if @my_order.save
        format.html { redirect_to @my_order, notice: 'My order was successfully created.' }
        format.json { render :show, status: :created, location: @my_order }
      else
        format.html { render :new }
        format.json { render json: @my_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_orders/1
  # PATCH/PUT /my_orders/1.json
  def update
    respond_to do |format|
      if @my_order.update(my_order_params)
        format.html { redirect_to @my_order, notice: 'My order was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_order }
      else
        format.html { render :edit }
        format.json { render json: @my_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_orders/1
  # DELETE /my_orders/1.json
  def destroy
    @my_order.destroy
    respond_to do |format|
      format.html { redirect_to my_orders_url, notice: 'My order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_order
      @my_order = MyOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_order_params
      params.require(:my_order).permit(:Name)
    end
end
