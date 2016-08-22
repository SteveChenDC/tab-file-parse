class OrdersController < ApplicationController
  def index
  end

  def import
    @revenue = Order.import(params[:file])
    redirect_to orders_path, notice: "Orders Added Successfully. Your total revenue is $#{@revenue}"
  end
end
