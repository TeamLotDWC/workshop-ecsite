class Public::ShippingAddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]


  def index
    @shipping_address = current_customer.shipping_addresses.new
    @shipping_addresses = current_customer.shipping_addresses.all
  end

  def create
    @shipping_address = current_customer.shipping_addresses.new(shipping_address_params)
    if @shipping_address.save
      redirect_to customers_shipping_addresses_path
    else
      @shipping_addresses = current_customer.shipping_addresses.all
      render 'index'
    end
  end

  def edit
  end

  def update
    if @shipping_address.update(shipping_address_params)
      redirect_to customers_shipping_addresses_path
    else
      render 'edit'
    end
  end

  def destroy
    @shipping_address.destroy
    redirect_to customers_shipping_addresses_path
  end

  private

  def set_address
    @shipping_address = current_customer.shipping_addresses.find(params[:id])
  end

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :zip_code, :address).merge(customer_id: current_customer.id)
  end


end
