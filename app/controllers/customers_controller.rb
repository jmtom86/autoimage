class CustomersController < ApplicationController
  def create
  	Customer.create(first_name: params[:first], last_name: params[:last], phone: params[:phone])
  	redirect_to "/main"
  end

  def new
  end

  def index
    @customers = Customer.all
    if params[:search]
      @customers = Customer.search(params[:search]).order("first_name DESC")
    else
      @customers = Customer.all.order("first_name DESC")
    end
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    puts "Editing"
    customer = Customer.find(params[:id])
    customer.first_name = params[:first]
    customer.last_name = params[:last]
    customer.phone = params[:phone]
    customer.save
    redirect_to "/customers/#{customer.id}"
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to "/main"
  end

end
