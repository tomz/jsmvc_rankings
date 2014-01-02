class StatsLogsController < ApplicationController

  def index
    @stats_logs = StatsLog.limit(Repository.count)
    respond_to do |format|
      format.html
      format.json { render json: @stats_logs }
    end
  end

end