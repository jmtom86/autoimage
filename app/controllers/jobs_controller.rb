class JobsController < ApplicationController
  def create
  	puts params
  	customer = Customer.find(params[:customer_id])
  	job = Job.create(customer: customer, make: params[:make], model: params[:model], year: params[:year], total: params[:total], date: Date.strptime(params[:date], '%m/%d/%Y'))
  	if params[:tint1]
  		Tintjob.create(tint: Tint.find(params[:tint1]), job: job, cost: params[:tint1cost])
  	end
  	if params[:tint2]
  		Tintjob.create(tint: Tint.find(params[:tint2]), job: job, cost: params[:tint2cost])
  	end
  	if params[:tint3]
  		Tintjob.create(tint: Tint.find(params[:tint3]), job: job, cost: params[:tint3cost])
  	end
  	if params[:tint4]
  		Tintjob.create(tint: Tint.find(params[:tint4]), job: job, cost: params[:tint4cost])
  	end
  	redirect_to "/customers/#{customer.id}"
  end

  def new
  	@customer = Customer.find(params[:id])
  	@tints = Tint.where(:done => false)
  	puts "TINTSSS-------"
  	puts @tints
  end

  def index
  end

  def show
    @job = Job.find(params[:id])
    @customer = Customer.find(@job.customer_id)
  end
end
