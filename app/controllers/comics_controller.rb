class ComicsController < ApplicationController

  def index
    @comics = Comic.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @comic = Comic.find(params[:id])
  end

end
