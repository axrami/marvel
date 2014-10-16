class ComicsController < ApplicationController

  def index
    if params[:letter]
      @comics = Comic.where("name LIKE '#{params[:letter]}%'").paginate(:page => params[:page], :per_page => 20)
    elsif params[:search]


    else
      @comics = Comic.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @comic = Comic.find(params[:id])
  end

end
