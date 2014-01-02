class ChartsController < ApplicationController

  def top
    by = params[:by] || "stars"
    repos = Repository.all.order_by({by => -1})
    categories = repos.collect {|r| r.name.capitalize}
    data = repos.collect {|r| r[by]}
    title = "Top JavaScript MVC Frameworks"
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart({type: 'column'})
      f.title({text: title})
      f.subtitle({text: "by Github #{by.capitalize} <em>as of #{StatsLog.last.created_at}</em>"})
      f.xAxis({categories: categories})
      f.yAxis({title: {text: "Number of #{by.capitalize}"}})
      f.plotOptions({
        line: {
          dataLabels: {
            enabled: true
          },
          enableMouseTracking: false,
        }
      })
      f.series({
        name: 'Framework',
        data: data
      })
    end
  end
end