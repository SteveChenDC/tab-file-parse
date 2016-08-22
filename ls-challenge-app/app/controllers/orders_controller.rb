class OrdersController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
  end
  
  def import
    @revenue = Order.import(params[:file])
    redirect_to orders_path, notice: "Orders Added Successfully. Your total revenue is #{number_to_currency(@revenue)}"
  end
end
