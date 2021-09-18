class Customers::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def leave_page
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customers_customer_path(@customer)
  end

  def leave_page
    @customer = Customer.find(params[:id])
  end

  def leave
    customer = Customer.find(params[:id])
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path       #............フラッシュメッセージ作成予定
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code,:email, :address, :telephone_number, :is_deleted)
  end

end
