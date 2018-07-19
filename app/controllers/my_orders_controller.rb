class MyOrdersController < ApplicationController
  before_action :set_my_order, only: [:show, :edit, :update, :destroy]

  # GET /my_orders
  # GET /my_orders.json
  def index
    @my_orders = MyOrder.all
    respond_to do |format|
      format.html
      format.csv { send_data @my_orders.to_csv(['Name','Email','Financial_Status','Paid_at','Fulfillment_Status','Fulfilled_at','Accepts_Marketing','Currency,Subtotal','Shipping','Taxes','Total','Discount_Code',
      'Discount_Amount','Shipping_Method','Created_at','Lineitem_quantity','Lineitem_name','Lineitem_price','Lineitem_compare_at_price','Lineitem_sku','Lineitem_requires_shipping',
      'Lineitem_taxable','Lineitem_fulfillment_status','Billing_Name','Billing_Street','Billing_Address1','Billing_Address2','Billing_Company','Billing_City','Billing_Zip','Billing_Province',
      'Billing_Country','Billing_Phone','Shipping_Name','Shipping_Street','Shipping_Address1','Shipping_Address2','Shipping_Company','Shipping_City','Shipping_Zip','Shipping_Province',
      'Shipping_Country','Shipping_Phone','Notes','Note_Attributes','Cancelled_at','Payment_Method','Payment_Reference','Refunded_Amount','Vendor','Id','Tags',
      'Risk_Level','Source','Lineitem_discount','Tax_1_Name','Tax_1_Value','Tax_2_Name','Tax_2_Value','Tax_3_Name','Tax_3_Value','Tax_4_Name','Tax_4_Value','Tax_5_Name','Tax_5_Value','Phone']) }
    end
  end
  def import
    ShopifyAPI::Order.delete_all
    MyOrder.delete_all
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
