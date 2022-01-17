class Admin::CustomersController < Admin::BaseController

    def index
        @customers = Customer.all.page(params[:page]).per(10)
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        if @customer.update(customer_params)
            redirect_to admin_orders_path, notice: "You have updated user successfully."
        else
            render "edit"
        end
    end

    private
	def customer_params
	  params.require(:customer).permit(:first_name,:family_name,:first_name_kana,:family_name_kana,:zip_code,:address,:phone_number,:email,:is_deleted)
	end

end
