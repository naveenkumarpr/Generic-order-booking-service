class PurchasesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :order_filtering, only:[:index]

  def index
    render json: @purchases, :include => [:customer, :payment_methods, :shipping_address, :billing_address, :purchase_items]
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.shipping_address.new(shipping_address_params)
    @purchase.billing_address.new(billing_address_params)
    assign_customer
    build_payment_methods
    build_purchase_items
    if @purchase.save
      render json: @purchase, :include => [:customer, :payment_methods, :shipping_address, :billing_address, :purchase_items]
    else
      render json: { Status:"FAILED", Erorr: @purchase.errors.full_messages }
    end
  end

  def update
    if params[:order_number].present? &&  params[:status].present?
        purchase = Purchase.find_by_order_number(params[:order_number])
        if purchase
          if Purchase::STATUSES.include?(params[:status])
            if purchase.is_status_updatable(params[:status])
              purchase.update_attribute(:status, params[:status])
              render json: {order_number: params[:order_number], updated_status: purchase.status, message: "status update successfull", success: true}
            else
              render json: { order_number: params[:order_number], updated_status: nil, message: "status changes not allowed", success: false}
            end
          else
            render json:{success:false,message:"Status is Invalid"}
          end
        else
          render json: {success: false,message:"Order Number is not Valid"}
        end
    else
      render json: { message: "Order Number or Status value is Empty", success: false}
    end
  end


    private
    def order_filtering
      if params[:order_number].present?
        @purchases = Purchase.where(order_number: params[:order_number])
      elsif params[:status].present?
        @purchases = Purchase.where(status:params[:status])
      elsif params[:start_date] && params[:end_date]
        @purchases = Purchase.where(created_at: params[:start_date]..params[:end_date])
      else
        @purchases = Purchase.all
      end
    end

    def assign_customer
      customer_params = params.permit(:full_name, :email, :mobile)
      if params[:full_name] && params[:email] &&params[:mobile]
        @purchase.customer = Customer.find_or_initialize_by(customer_params)
      else
       render json: @purchase.errors
      end
    end
def update_status
    if params[:order_number].present? &&  params[:status].present?
        purchase = Purchase.find_by_order_number(params[:order_number])
        if purchase
          if Purchase::STATUSES.include?(params[:status])
            if purchase.is_status_updatable(params[:status])
              purchase.update_attribute(:status, params[:status])
              render json: {order_number: params[:order_number], updated_status: purchase.status, message: "status update successfull", success: true}
            else
              render json: {order_number: params[:order_number], updated_status: nil, message: "status changes not allowed", success: false}
            end
          else
            render json:{success:false,message:"Status is Invalid"}
          end
        else
          render json: {success: false,message:"Order Number is not Valid"}
        end
    else
      render json: { message: "Order Number or Status value is Empty", success: false}
    end
  end

    def purchase_params
      params.require(:purchase).permit(:order_number,:order_placed_at, :vertical_code, :total_mrp, :total_discount, :total_final_amount, :status)
    end

    def billing_address_params
      params.require(:billing_address).permit(:name, :email, :mobile, :address_line_1, :address_line_2, :city, :pincode, :state, :country)
    end

    def shipping_address_params
      params.require(:shipping_address).permit(:name, :email, :mobile, :address_line_1, :address_line_2, :city, :pincode, :state, :country)
    end

    def build_payment_methods
      params[:payment_methods].each do |payment_hash|
        @purchase.payment_methods.new(
          payment_mode: payment_hash[:payment_mode],
          amount: payment_hash[:amount],
          transaction_reference_number: payment_hash[:transaction_reference_number],
          transaction_at: payment_hash[:transaction_at])
      end
    end

    def build_purchase_items
      params[:purchase_items].each do |purchase_item_hash|
        @purchase.purchase_items.new(
          product_code: purchase_item_hash[:product_code],
          product_name: purchase_item_hash[:product_name],
          unit_product_mrp: purchase_item_hash[:unit_product_mrp],
          unit_product_discount: purchase_item_hash[:unit_product_discount],
          unit_product_amount: purchase_item_hash[:unit_product_amount],
          total_final_amount: purchase_item_hash[:total_final_amount],
          quantity: purchase_item_hash[:quantity],
          image_url: purchase_item_hash[:image_url])
      end
    end
  end
