class ComicsController < ApplicationController

  def index
    if params[:letter]
      @comics = Comic.where("name LIKE '#{params[:letter]}%'").paginate(:page => params[:page], :per_page => 20)
      puts 'am i working??'
    else
      @comics = Comic.paginate(:page => params[:page], :per_page => 10)
      puts 'or is this working'
    end
  end

  def show
    @comic = Comic.find(params[:id])
  end

end
