class RollController < ApplicationController
  def index
    @rolls = Tint.find_by_sql("SELECT * from tints ORDER BY tints.created_at DESC")
  end

  def new
  end

  def create
  	puts "PARSING DATE"
  	puts Date.strptime(params[:date], '%m/%d/%Y')
  	Tint.create(name: params[:name], date_bought: Date.strptime(params[:date], '%m/%d/%Y'), cost: params[:cost], done: false)
  	redirect_to "/main"
  end

  def destroy
    tint = Tint.find(params[:id])
    tint.destroy
    redirect_to "/main"
  end

  def show
    @tint = Tint.find(params[:id])
    tint = Tint.find(params[:id])
    puts "ROLL ID"
    puts @tint.id
    @jobs = Tintjob.find_by_sql(["SELECT jobs.id, jobs.make, jobs.model, jobs.date FROM tintjobs LEFT JOIN jobs on tintjobs.job_id = jobs.id WHERE tintjobs.tint_id = ?", tint.id])
  end
end
