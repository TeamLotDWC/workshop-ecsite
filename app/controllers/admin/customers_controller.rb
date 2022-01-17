class Admin::CustomersController < Admin::BaseController

    def index
        @customers = Customer.all
    end

end
