class JobsController < ApplicationController
  def create
  	puts params
  	customer = Customer.find(params[:customer_id])
    tints = []
    puts "DATE!!!!"
    puts params[:date].to_s
  	job = Job.create(customer: customer, make: params[:make], model: params[:model], year: params[:year], total: params[:total], date: Date.strptime(params[:date], '%m/%d/%Y'))
  	if params[:tint1]
      tint1 = Tint.find(params[:tint1])
      tints.push(tint1.name)
  		Tintjob.create(tint: tint1, job: job, cost: params[:tint1cost], tint_name: tint1.name)
  	end
  	if params[:tint2]
      tint2 = Tint.find(params[:tint2])
      if tints.include? tint2.name
        Tintjob.create(tint: Tint.find(params[:tint2]), job: job, cost: params[:tint2cost], tint_name: "")  
      else
        tints.push(tint2.name)
        Tintjob.create(tint: Tint.find(params[:tint2]), job: job, cost: params[:tint2cost], tint_name: tint2.name)
      end
  	end
  	if params[:tint3]
      tint3 = Tint.find(params[:tint3])
      if tints.include? tint3.name
        Tintjob.create(tint: Tint.find(params[:tint3]), job: job, cost: params[:tint3cost], tint_name: "")  
      else
        tints.push(tint3.name)
        Tintjob.create(tint: Tint.find(params[:tint3]), job: job, cost: params[:tint3cost], tint_name: tint3.name)
      end
  		# Tintjob.create(tint: Tint.find(params[:tint3]), job: job, cost: params[:tint3cost])
  	end
  	if params[:tint4]
      tint4 = Tint.find(params[:tint4])
      if tints.include? tint4.name
        Tintjob.create(tint: Tint.find(params[:tint4]), job: job, cost: params[:tint4cost], tint_name: "")  
      else
        tints.push(tint4.name)
        Tintjob.create(tint: Tint.find(params[:tint4]), job: job, cost: params[:tint4cost], tint_name: tint4.name)
      end
  		# Tintjob.create(tint: Tint.find(params[:tint4]), job: job, cost: params[:tint4cost])
  	end
    if params[:tint5]
      tint5 = Tint.find(params[:tint5])
      if tints.include? tint5.name
        Tintjob.create(tint: Tint.find(params[:tint5]), job: job, cost: params[:tint5cost], tint_name: "")  
      else
        tints.push(tint5.name)
        Tintjob.create(tint: Tint.find(params[:tint5]), job: job, cost: params[:tint5cost], tint_name: tint5.name)
      end
      # Tintjob.create(tint: Tint.find(params[:tint4]), job: job, cost: params[:tint4cost])
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
    @jobs = Job.order(date: :desc)
  end

  def show
    @job = Job.find(params[:id])
    @customer = Customer.find(@job.customer_id)
  end
end
