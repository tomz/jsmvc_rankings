class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.order_by(stars: -1).limit(500)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @repositories }
    end
  end

end
