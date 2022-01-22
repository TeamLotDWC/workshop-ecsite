class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    redirect_to customers_path(current_customer) unless current_customer == @customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path(current_customer)
    else
      render :show
    end
  end

  def delete
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "Thanyou for using this site ！"
    redirect_to root_path
  end

  def confirm_delete
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :zip_code, :address, :phone_number, :email)
  end
end
