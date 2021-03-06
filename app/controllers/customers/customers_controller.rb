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
    if @customer.update(customer_params)
      redirect_to customers_customer_path(@customer)
      flash[:notice] = "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def leave_page
    @customer = Customer.find(params[:id])
  end

  def leave
    customer = Customer.find(params[:id])
    customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会手続きが完了しました。またのご利用お待ちしております。"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code,:email, :address, :telephone_number, :is_deleted)
  end

end
