class MainController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@customers = Customer.find_by_sql("SELECT * from customers ORDER BY customers.created_at DESC LIMIT 3")
  	# @rolls = Tint.order(:name)
    @rolls = Tint.find_by_sql("SELECT * from tints ORDER BY tints.created_at DESC LIMIT 5")
  	# @tintCounts = Tintjob.find_by_sql("SELECT tints.name, COUNT(tints.name) as c FROM tintjobs left join tints on tintjobs.tint_id = tints.id GROUP BY tints.name")
    # puts "!!!!!! MONTH !!!!!"
    # puts Time.now.month

    @tintCounts = Tint.find_by_sql("SELECT tints.name, COUNT(tintjobs.tint_id) as c FROM tints left join tintjobs on tints.id = tintjobs.tint_id GROUP BY tints.id ORDER BY c DESC")
  	# puts "--- ROLLLS ---"
  	# puts @tintCounts

  	@chart = LazyHighCharts::HighChart.new('pie') do |f|
  f.chart({:defaultSeriesType=>"bar" , :margin=> [50, 200, 60, 170]} )
  series = {
    :type=> 'pie',
    :name=> 'Browser share',
    :data=> [
      ['Firefox', 45.0],
      ['IE', 26.8],
      ['Chrome', 12.8],
      ['Safari', 8.5],
      ['Opera', 6.9],
      ['Others', 0]
    ]
  }
  f.series(series)
  f.options[:title][:text] = "Tint distribution"
  f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
  f.plot_options(:pie=>{
    :allowPointSelect=>true, 
    :cursor=>"pointer" , 
    :dataLabels=>{
      :enabled=>true,
      :color=>"black",
      :style=>{
        :font=>"13px Trebuchet MS, Verdana, sans-serif"
      }
    }
  })
 end
  end

  def create
  end
end
